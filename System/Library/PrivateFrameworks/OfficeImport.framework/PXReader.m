@interface PXReader
- (id)defaultPassphrase;
- (id)read;
@end

@implementation PXReader

- (id)read
{
  v3 = (void *)MEMORY[0x23EC9A170](self, a2);
  [(OCDEncryptedReader *)self useUnencryptedDocument];
  v4 = [(OCXReader *)self zipPackage];

  if (!v4) {
    [(OCXReader *)self verifyFileFormat];
  }
  v5 = [(OCXReader *)self zipPackage];
  v6 = [(OCDReader *)self fileName];
  v7 = [(OCDReader *)self cancelDelegate];
  BOOL v8 = [(OCDReader *)self isThumbnail];
  v9 = [(OCDReader *)self delegate];
  v11 = +[PXPresentation readFromPackage:v5 fileName:v6 reader:self cancel:v7 isThumbnail:v8 delegate:v9];

  return v11;
}

- (id)defaultPassphrase
{
  return @"/01Hannes Ruescher/01";
}

@end