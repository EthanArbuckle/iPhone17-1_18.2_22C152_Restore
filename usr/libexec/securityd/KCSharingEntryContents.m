@interface KCSharingEntryContents
- (BOOL)isFullyDecoded;
- (KCSharingEntryContents)initWithContents:(id)a3 fullyDecoded:(BOOL)a4;
- (id)contents;
@end

@implementation KCSharingEntryContents

- (void).cxx_destruct
{
}

- (BOOL)isFullyDecoded
{
  return self->_fullyDecoded;
}

- (id)contents
{
  return self->_contents;
}

- (KCSharingEntryContents)initWithContents:(id)a3 fullyDecoded:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KCSharingEntryContents;
  v8 = [(KCSharingEntryContents *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_contents, a3);
    v9->_fullyDecoded = a4;
  }

  return v9;
}

@end