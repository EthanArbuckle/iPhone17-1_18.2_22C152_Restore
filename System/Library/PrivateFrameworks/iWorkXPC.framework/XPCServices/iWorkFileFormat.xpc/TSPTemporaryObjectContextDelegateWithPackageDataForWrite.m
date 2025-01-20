@interface TSPTemporaryObjectContextDelegateWithPackageDataForWrite
- (TSPTemporaryObjectContextDelegateWithPackageDataForWrite)initWithPackageDataForWrite:(id)a3 additionalDocumentPropertiesForWrite:(id)a4;
- (id)additionalDocumentPropertiesForWrite;
- (id)packageDataForWrite;
@end

@implementation TSPTemporaryObjectContextDelegateWithPackageDataForWrite

- (TSPTemporaryObjectContextDelegateWithPackageDataForWrite)initWithPackageDataForWrite:(id)a3 additionalDocumentPropertiesForWrite:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TSPTemporaryObjectContextDelegateWithPackageDataForWrite;
  v8 = [(TSPTemporaryObjectContextDelegate *)&v14 init];
  if (v8)
  {
    v9 = (NSDictionary *)[v6 copy];
    packageDataForWrite = v8->_packageDataForWrite;
    v8->_packageDataForWrite = v9;

    v11 = (NSDictionary *)[v7 copy];
    additionalDocumentPropertiesForWrite = v8->_additionalDocumentPropertiesForWrite;
    v8->_additionalDocumentPropertiesForWrite = v11;
  }
  return v8;
}

- (id)packageDataForWrite
{
  return self->_packageDataForWrite;
}

- (id)additionalDocumentPropertiesForWrite
{
  return self->_additionalDocumentPropertiesForWrite;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalDocumentPropertiesForWrite, 0);
  objc_storeStrong((id *)&self->_packageDataForWrite, 0);
}

@end