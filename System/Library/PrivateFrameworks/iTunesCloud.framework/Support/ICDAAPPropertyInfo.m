@interface ICDAAPPropertyInfo
+ (ICDAAPPropertyInfo)sharedContainerPropertyInfo;
+ (ICDAAPPropertyInfo)sharedItemPropertyInfo;
- (BOOL)hasInfoForProperty:(id)a3;
- (NSMutableDictionary)codeMap;
- (NSMutableDictionary)valueTypeMap;
- (id)_init;
- (int64_t)valueTypeForProperty:(id)a3;
- (unsigned)elementCodeForProperty:(id)a3;
- (void)mapProperty:(id)a3 toCode:(unsigned int)a4 valueType:(int64_t)a5;
- (void)setCodeMap:(id)a3;
- (void)setValueTypeMap:(id)a3;
@end

@implementation ICDAAPPropertyInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueTypeMap, 0);

  objc_storeStrong((id *)&self->_codeMap, 0);
}

- (void)setValueTypeMap:(id)a3
{
}

- (NSMutableDictionary)valueTypeMap
{
  return self->_valueTypeMap;
}

- (void)setCodeMap:(id)a3
{
}

- (NSMutableDictionary)codeMap
{
  return self->_codeMap;
}

- (void)mapProperty:(id)a3 toCode:(unsigned int)a4 valueType:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v9 = +[NSNumber numberWithUnsignedInt:v6];
  [(NSMutableDictionary *)self->_codeMap setObject:v9 forKeyedSubscript:v8];

  id v10 = +[NSNumber numberWithInteger:a5];
  [(NSMutableDictionary *)self->_valueTypeMap setObject:v10 forKeyedSubscript:v8];
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)ICDAAPPropertyInfo;
  v2 = [(ICDAAPPropertyInfo *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    codeMap = v2->_codeMap;
    v2->_codeMap = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    valueTypeMap = v2->_valueTypeMap;
    v2->_valueTypeMap = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (int64_t)valueTypeForProperty:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_valueTypeMap objectForKeyedSubscript:a3];
  int64_t v4 = [v3 unsignedIntValue];

  return v4;
}

- (unsigned)elementCodeForProperty:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_codeMap objectForKeyedSubscript:a3];
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (BOOL)hasInfoForProperty:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_codeMap objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (ICDAAPPropertyInfo)sharedContainerPropertyInfo
{
  if (qword_1001F3948 != -1) {
    dispatch_once(&qword_1001F3948, &stru_1001BCB60);
  }
  v2 = (void *)qword_1001F3940;

  return (ICDAAPPropertyInfo *)v2;
}

+ (ICDAAPPropertyInfo)sharedItemPropertyInfo
{
  if (qword_1001F3938 != -1) {
    dispatch_once(&qword_1001F3938, &stru_1001BCB40);
  }
  v2 = (void *)qword_1001F3930;

  return (ICDAAPPropertyInfo *)v2;
}

@end