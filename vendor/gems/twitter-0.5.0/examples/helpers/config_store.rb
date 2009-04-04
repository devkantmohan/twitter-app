class ConfigStore
  attr_reader :file
  
  def initialize(file)
    @file = file
  end
  
  def load
    @config ||= YAML::load(open(file))
    self
  end
  
  def [](key)
    load
    @config[key]
  end
  
  def []=(key, value)
    @config[key] = value
  end
  
  def update(c={})
    @config.merge!(c)
    save
  end
  
  def save
    File.open(file, 'w') { |f| f.write(YAML.dump(@config)) }
  end
end