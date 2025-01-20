@interface MFQuotedAttachmentsInfo
- (MFQuotedAttachmentsInfo)initWithContentIDs:(id)a3;
- (NSArray)contentIDs;
@end

@implementation MFQuotedAttachmentsInfo

- (MFQuotedAttachmentsInfo)initWithContentIDs:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFQuotedAttachmentsInfo;
  v6 = [(MFQuotedAttachmentsInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contentIDs, a3);
  }

  return v7;
}

- (NSArray)contentIDs
{
  return self->_contentIDs;
}

- (void).cxx_destruct
{
}

@end