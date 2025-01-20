@interface FMDOneShotCipher
- (FMDOneShotCipher)initWithDictionary:(id)a3;
- (NSData)initializationVector;
- (NSData)key;
- (NSData)tag;
- (NSDictionary)dictionaryValue;
- (void)setInitializationVector:(id)a3;
- (void)setKey:(id)a3;
- (void)setTag:(id)a3;
@end

@implementation FMDOneShotCipher

- (FMDOneShotCipher)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDOneShotCipher;
  v5 = [(FMDOneShotCipher *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"iv"];
    [(FMDOneShotCipher *)v5 setInitializationVector:v6];

    v7 = [v4 objectForKeyedSubscript:@"key"];
    [(FMDOneShotCipher *)v5 setKey:v7];

    v8 = [v4 objectForKeyedSubscript:@"tag"];
    [(FMDOneShotCipher *)v5 setTag:v8];
  }
  return v5;
}

- (NSDictionary)dictionaryValue
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = [(FMDOneShotCipher *)self initializationVector];
  [v3 fm_safeSetObject:v4 forKey:@"iv"];

  v5 = [(FMDOneShotCipher *)self key];
  [v3 fm_safeSetObject:v5 forKey:@"key"];

  v6 = [(FMDOneShotCipher *)self tag];
  [v3 fm_safeSetObject:v6 forKey:@"tag"];

  return (NSDictionary *)v3;
}

- (NSData)initializationVector
{
  return self->_initializationVector;
}

- (void)setInitializationVector:(id)a3
{
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSData)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_initializationVector, 0);
}

@end