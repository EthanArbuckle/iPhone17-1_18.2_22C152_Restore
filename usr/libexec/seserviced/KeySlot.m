@interface KeySlot
+ (BOOL)_acl:(id)a3 containsOperation:(const char *)a4;
+ (id)emptySlot:(unsigned __int16)a3;
+ (id)withKeyData:(id)a3 state:(unsigned __int8)a4;
- (BOOL)synchronizable;
- (NSData)keyIdentifier;
- (id)description;
- (int64_t)designation;
- (unsigned)keyNumber;
- (unsigned)number;
- (unsigned)state;
- (void)didLoadKey:(id)a3;
- (void)resetLegacyToAvailable;
- (void)resetToEmpty;
- (void)setDesignation:(int64_t)a3;
- (void)setState:(unsigned __int8)a3;
@end

@implementation KeySlot

+ (id)emptySlot:(unsigned __int16)a3
{
  v4 = (_WORD *)objc_opt_new();
  v4[5] = a3;
  [v4 resetToEmpty];

  return v4;
}

+ (id)withKeyData:(id)a3 state:(unsigned __int8)a4
{
  id v4 = a3;
  unsigned long long v14 = 0u;
  long long v15 = 0u;
  int v5 = DERParseSequenceSpecContent();
  if (v5)
  {
    int v6 = v5;
    v7 = SESDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = [v4 base64];
      *(_DWORD *)buf = 138412546;
      v17 = v8;
      __int16 v18 = 1024;
      int v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to parse keyData %@ %d", buf, 0x12u);
    }
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = objc_opt_new();
    *(unsigned char *)(v9 + 8) = 2;
    *(_WORD *)(v9 + 10) = bswap32(MEMORY[0]) >> 16;
    *(_DWORD *)(v9 + 12) = bswap32(MEMORY[0]);
    uint64_t v10 = DERDecodeData((const DERItem *)&v14, 4uLL);
    v11 = *(void **)(v9 + 16);
    *(void *)(v9 + 16) = v10;

    BOOL v12 = *((void *)&v15 + 1) == 3 && *(unsigned __int8 *)(v15 + 2) == 255;
    *(unsigned char *)(v9 + 9) = v12;
    *(void *)(v9 + 24) = 0;
  }

  return (id)v9;
}

- (id)description
{
  uint64_t state = self->_state;
  uint64_t number = self->_number;
  uint64_t keyNumber = self->_keyNumber;
  int v6 = [(NSData *)self->_keyIdentifier asHexString];
  v7 = +[NSString stringWithFormat:@"Slot: state %d number 0x%X keyNumber 0x%X keyIdentifier %@ synchronizable %d designation %d", state, number, keyNumber, v6, self->_synchronizable, self->_designation];

  return v7;
}

- (void)resetToEmpty
{
  self->_uint64_t state = 1;
  self->_uint64_t keyNumber = -1;
  keyIdentifier = self->_keyIdentifier;
  self->_keyIdentifier = 0;

  self->_synchronizable = 0;
  self->_designation = 0;
}

- (void)resetLegacyToAvailable
{
  self->_uint64_t state = 5;
  self->_uint64_t keyNumber = -1;
  keyIdentifier = self->_keyIdentifier;
  self->_keyIdentifier = 0;

  self->_synchronizable = 0;
  self->_designation = 0;
}

- (void)didLoadKey:(id)a3
{
  id v12 = a3;
  self->_uint64_t state = 2;
  self->_uint64_t keyNumber = [v12 keyNumber];
  id v4 = [v12 publicKey];
  int v5 = [v4 ses_sha256];
  [v5 subdataWithRange:0, 16];
  int v6 = (NSData *)objc_claimAutoreleasedReturnValue();
  keyIdentifier = self->_keyIdentifier;
  self->_keyIdentifier = v6;

  if ([v12 isExportedData])
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    uint64_t v9 = objc_opt_class();
    id v10 = [v12 accessControlConstraintsItem];
    unsigned __int8 v8 = [v9 _acl:v10 containsOperation:v11 operation:"os"];
  }
  self->_synchronizable = v8;
}

+ (BOOL)_acl:(id)a3 containsOperation:(const char *)a4
{
  $BE749665CD263385F3F5ED554982D87D v14 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000575B4;
  v9[3] = &unk_10040DAD8;
  v9[5] = strlen(a4);
  v9[6] = a4;
  v9[4] = &v10;
  int v5 = DERDecodeSequenceWithBlock((uint64_t)&v14, (uint64_t)v9);
  if (v5)
  {
    int v6 = SESDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to parse ACL entries? %d", buf, 8u);
    }
  }
  char v7 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned __int8)a3
{
  self->_uint64_t state = a3;
}

- (unsigned)number
{
  return self->_number;
}

- (unsigned)keyNumber
{
  return self->_keyNumber;
}

- (NSData)keyIdentifier
{
  return self->_keyIdentifier;
}

- (BOOL)synchronizable
{
  return self->_synchronizable;
}

- (int64_t)designation
{
  return self->_designation;
}

- (void)setDesignation:(int64_t)a3
{
  self->_designation = a3;
}

- (void).cxx_destruct
{
}

@end