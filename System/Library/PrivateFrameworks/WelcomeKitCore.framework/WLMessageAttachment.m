@interface WLMessageAttachment
- (NSData)data;
- (NSString)fileName;
- (NSString)guid;
- (NSString)mimeType;
- (NSString)uti;
- (id)_initWithData:(id)a3 fileName:(id)a4 mimeType:(id)a5 uti:(id)a6;
- (int64_t)rowID;
- (void)setGuid:(id)a3;
- (void)setRowID:(int64_t *)a3;
@end

@implementation WLMessageAttachment

- (id)_initWithData:(id)a3 fileName:(id)a4 mimeType:(id)a5 uti:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)WLMessageAttachment;
  v15 = [(WLMessageAttachment *)&v18 init];
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_data, a3);
    objc_storeStrong(p_isa + 1, a4);
    objc_storeStrong(p_isa + 2, a5);
    objc_storeStrong(p_isa + 3, a6);
  }

  return p_isa;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (NSString)uti
{
  return self->_uti;
}

- (NSData)data
{
  return self->_data;
}

- (int64_t)rowID
{
  return self->_rowID;
}

- (void)setRowID:(int64_t *)a3
{
  self->_rowID = a3;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  self->_guid = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
}

@end