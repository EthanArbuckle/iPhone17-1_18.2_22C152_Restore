@interface MBMMCSEncryptedItemReaderInfo
- (BOOL)closeWithError:(id *)a3;
- (BOOL)openWithError:(id *)a3;
- (BOOL)readWithOffset:(unint64_t)a3 buffer:(char *)a4 bufferLength:(unint64_t)a5 bytesRead:(unint64_t *)a6 error:(id *)a7;
- (BOOL)statWithSize:(unint64_t *)a3 error:(id *)a4;
- (MBKeyBagFile)keybagFile;
- (MBMMCSEncryptedItemReaderInfo)initWithItemID:(unint64_t)a3 path:(id)a4 encryptedKey:(id)a5;
- (NSData)encryptedKey;
- (NSString)path;
- (unint64_t)itemID;
- (void)dealloc;
- (void)setEncryptedKey:(id)a3;
- (void)setItemID:(unint64_t)a3;
- (void)setKeybagFile:(id)a3;
- (void)setPath:(id)a3;
@end

@implementation MBMMCSEncryptedItemReaderInfo

- (MBMMCSEncryptedItemReaderInfo)initWithItemID:(unint64_t)a3 path:(id)a4 encryptedKey:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)MBMMCSEncryptedItemReaderInfo;
  v8 = [(MBMMCSEncryptedItemReaderInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_itemID = a3;
    v8->_path = (NSString *)a4;
    v9->_encryptedKey = (NSData *)a5;
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBMMCSEncryptedItemReaderInfo;
  [(MBMMCSEncryptedItemReaderInfo *)&v3 dealloc];
}

- (BOOL)openWithError:(id *)a3
{
  keybagFile = self->_keybagFile;
  if (keybagFile) {
    return keybagFile != 0;
  }
  v7 = +[MBKeyBagFile keybagFileWithPath:self->_path error:a3];
  self->_keybagFile = v7;
  if (!v7)
  {
    keybagFile = 0;
    return keybagFile != 0;
  }
  if ([(MBKeyBagFile *)v7 validateEncryptionKey:self->_encryptedKey error:0])
  {
    keybagFile = self->_keybagFile;
    return keybagFile != 0;
  }
  v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t itemID = self->_itemID;
    path = self->_path;
    *(_DWORD *)buf = 138412546;
    v15 = path;
    __int16 v16 = 2048;
    unint64_t v17 = itemID;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to validate encryption key: %@ (item %llu)", buf, 0x16u);
    v12 = self->_path;
    unint64_t v13 = self->_itemID;
    _MBLog();
  }
  -[MBMMCSEncryptedItemReaderInfo closeWithError:](self, "closeWithError:", 0, v12, v13);
  if (!a3) {
    return 0;
  }
  objc_super v11 = +[MBError errorWithDomain:kMMCSErrorDomain code:28 path:self->_path format:@"File key validation failed in MMCSEncryptedItemReaderInfo"];
  BOOL result = 0;
  *a3 = v11;
  return result;
}

- (BOOL)statWithSize:(unint64_t *)a3 error:(id *)a4
{
  keybagFile = self->_keybagFile;
  if (keybagFile)
  {
    if (a3) {
      *a3 = [(MBKeyBagFile *)self->_keybagFile size];
    }
  }
  else if (a4)
  {
    *a4 = +[MBError posixErrorWithCode:9 path:self->_path format:@"MMCS item reader not opened"];
  }
  return keybagFile != 0;
}

- (BOOL)readWithOffset:(unint64_t)a3 buffer:(char *)a4 bufferLength:(unint64_t)a5 bytesRead:(unint64_t *)a6 error:(id *)a7
{
  unsigned int v8 = [(MBKeyBagFile *)self->_keybagFile readWithBytes:a4 count:a5 offset:a3 error:a7];
  if (a6 && (v8 & 0x80000000) == 0) {
    *a6 = v8;
  }
  return (v8 & 0x80000000) == 0;
}

- (BOOL)closeWithError:(id *)a3
{
  keybagFile = self->_keybagFile;
  if (!keybagFile) {
    return 1;
  }
  unsigned __int8 v5 = [(MBKeyBagFile *)keybagFile closeWithError:a3];

  self->_keybagFile = 0;
  return v5;
}

- (unint64_t)itemID
{
  return self->_itemID;
}

- (void)setItemID:(unint64_t)a3
{
  self->_unint64_t itemID = a3;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (MBKeyBagFile)keybagFile
{
  return self->_keybagFile;
}

- (void)setKeybagFile:(id)a3
{
}

- (NSData)encryptedKey
{
  return self->_encryptedKey;
}

- (void)setEncryptedKey:(id)a3
{
}

@end