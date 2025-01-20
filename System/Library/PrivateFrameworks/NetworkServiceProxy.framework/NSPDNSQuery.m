@interface NSPDNSQuery
- (NSPDNSQuery)initWithName:(id)a3 recordType:(int64_t)a4 recordClass:(int64_t)a5;
- (NSString)name;
- (id)copyStateDictionary;
- (int64_t)recordClass;
- (int64_t)recordType;
@end

@implementation NSPDNSQuery

- (NSPDNSQuery)initWithName:(id)a3 recordType:(int64_t)a4 recordClass:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NSPDNSQuery;
  v10 = [(NSPDNSQuery *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_name, a3);
    v11->_recordType = a4;
    v11->_recordClass = a5;
  }

  return v11;
}

- (id)copyStateDictionary
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v4 = [(NSPDNSQuery *)self name];
  v5 = +[NSPDNSResourceRecord typeToString:[(NSPDNSQuery *)self recordType]];
  v6 = objc_msgSend(v3, "initWithObjectsAndKeys:", v4, @"name", v5, @"type", 0);

  return v6;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)recordType
{
  return self->_recordType;
}

- (int64_t)recordClass
{
  return self->_recordClass;
}

- (void).cxx_destruct
{
}

@end