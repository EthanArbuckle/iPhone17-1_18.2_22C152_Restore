@interface WXReader
- (id)defaultPassphrase;
- (id)read;
@end

@implementation WXReader

- (id)read
{
  v3 = (void *)MEMORY[0x23EC9A170](self, a2);
  [(OCDEncryptedReader *)self useUnencryptedDocument];
  v4 = [(OCXReader *)self zipPackage];

  if (!v4) {
    [(OCXReader *)self verifyFileFormat];
  }
  v5 = [(OCXReader *)self zipPackage];
  v6 = [(OCDReader *)self cancelDelegate];
  v8 = +[WXDocument documentFrom:v5 reader:self cancel:v6 asThumbnail:[(OCDReader *)self isThumbnail]];

  return v8;
}

- (id)defaultPassphrase
{
  return 0;
}

@end