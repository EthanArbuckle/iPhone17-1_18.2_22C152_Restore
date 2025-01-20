@interface MRDInitiatePlaybackMessage
- (MRDInitiatePlaybackMessage)initWithBundleID:(id)a3 indexPathData:(id)a4;
- (NSData)indexPathData;
- (NSString)bundleID;
@end

@implementation MRDInitiatePlaybackMessage

- (MRDInitiatePlaybackMessage)initWithBundleID:(id)a3 indexPathData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRDInitiatePlaybackMessage;
  v8 = [(MRDInitiatePlaybackMessage *)&v14 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    bundleID = v8->_bundleID;
    v8->_bundleID = v9;

    v11 = (NSData *)[v7 copy];
    indexPathData = v8->_indexPathData;
    v8->_indexPathData = v11;
  }
  return v8;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSData)indexPathData
{
  return self->_indexPathData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPathData, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end