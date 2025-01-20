@interface SSMutableBagProfileConfig
- (NSMutableDictionary)mutableBagKeysDictionary;
- (SSMutableBagProfileConfig)init;
- (id)bagKeysDictionary;
- (void)registerBagKey:(id)a3 valueType:(unint64_t)a4;
- (void)registerBagKey:(id)a3 valueType:(unint64_t)a4 defaultValue:(id)a5;
- (void)setMutableBagKeysDictionary:(id)a3;
@end

@implementation SSMutableBagProfileConfig

- (SSMutableBagProfileConfig)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSMutableBagProfileConfig;
  v2 = [(SSBagProfileConfig *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mutableBagKeysDictionary = v2->_mutableBagKeysDictionary;
    v2->_mutableBagKeysDictionary = v3;
  }
  return v2;
}

- (id)bagKeysDictionary
{
  v2 = [(SSMutableBagProfileConfig *)self mutableBagKeysDictionary];
  v3 = (void *)[v2 copy];

  return v3;
}

- (void)registerBagKey:(id)a3 valueType:(unint64_t)a4
{
}

- (void)registerBagKey:(id)a3 valueType:(unint64_t)a4 defaultValue:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v11 = [[SSBagKey alloc] initWithStringRepresentation:v9 valueType:a4 defaultValue:v8];

  v10 = [(SSMutableBagProfileConfig *)self mutableBagKeysDictionary];
  [v10 setObject:v11 forKeyedSubscript:v9];
}

- (NSMutableDictionary)mutableBagKeysDictionary
{
  return self->_mutableBagKeysDictionary;
}

- (void)setMutableBagKeysDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end