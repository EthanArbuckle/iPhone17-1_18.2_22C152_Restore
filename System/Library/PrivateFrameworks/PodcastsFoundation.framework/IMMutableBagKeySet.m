@interface IMMutableBagKeySet
- (IMMutableBagKeySet)init;
- (NSMutableDictionary)defaultValueMap;
- (NSMutableDictionary)valueTypeMap;
- (void)addBagKey:(id)a3 valueType:(unint64_t)a4 defaultValue:(id)a5;
- (void)setDefaultValueMap:(id)a3;
- (void)setValueTypeMap:(id)a3;
@end

@implementation IMMutableBagKeySet

- (NSMutableDictionary)valueTypeMap
{
  return self->_valueTypeMap;
}

- (void)addBagKey:(id)a3 valueType:(unint64_t)a4 defaultValue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9) {
    [(NSMutableDictionary *)self->_defaultValueMap setObject:v9 forKeyedSubscript:v8];
  }
  v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)self->_valueTypeMap setObject:v10 forKeyedSubscript:v8];

  v11.receiver = self;
  v11.super_class = (Class)IMMutableBagKeySet;
  [(AMSMutableBagKeySet *)&v11 addBagKey:v8 valueType:a4 defaultValue:v9];
}

- (IMMutableBagKeySet)init
{
  v8.receiver = self;
  v8.super_class = (Class)IMMutableBagKeySet;
  v2 = [(AMSBagKeySet *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    defaultValueMap = v2->_defaultValueMap;
    v2->_defaultValueMap = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    valueTypeMap = v2->_valueTypeMap;
    v2->_valueTypeMap = v5;
  }
  return v2;
}

- (NSMutableDictionary)defaultValueMap
{
  return self->_defaultValueMap;
}

- (void)setDefaultValueMap:(id)a3
{
}

- (void)setValueTypeMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueTypeMap, 0);
  objc_storeStrong((id *)&self->_defaultValueMap, 0);
}

@end