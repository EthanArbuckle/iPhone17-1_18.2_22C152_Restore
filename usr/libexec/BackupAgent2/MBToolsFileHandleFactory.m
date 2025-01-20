@interface MBToolsFileHandleFactory
- (MBToolsFileHandleFactory)initWithKeyBag:(id)a3 key:(id)a4;
- (id)fileHandleWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5 error:(id *)a6;
@end

@implementation MBToolsFileHandleFactory

- (MBToolsFileHandleFactory)initWithKeyBag:(id)a3 key:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MBToolsFileHandleFactory;
  v9 = [(MBToolsFileHandleFactory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keybag, a3);
    objc_storeStrong((id *)&v10->_key, a4);
  }

  return v10;
}

- (id)fileHandleWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  uint64_t v7 = a5;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  if (self->_keybag && self->_key)
  {
    uint64_t v11 = +[MBEncryptedFileHandle encryptedFileHandleForRestoreWithPath:keybag:key:error:](MBEncryptedFileHandle, "encryptedFileHandleForRestoreWithPath:keybag:key:error:", v10);
  }
  else
  {
    uint64_t v11 = +[MBBasicFileHandle basicFileHandleWithPath:v10 flags:v8 mode:v7 error:a6];
  }
  objc_super v12 = (void *)v11;

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_keybag, 0);
}

@end