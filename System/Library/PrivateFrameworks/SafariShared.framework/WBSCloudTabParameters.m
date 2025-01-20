@interface WBSCloudTabParameters
- (BOOL)isPinned;
- (BOOL)isShowingReader;
- (NSDictionary)readerScrollPosition;
- (NSString)sceneID;
- (NSString)title;
- (NSURL)url;
- (NSUUID)uuid;
- (WBSCloudTabParameters)initWithURL:(id)a3;
- (double)lastViewedTime;
- (void)setLastViewedTime:(double)a3;
- (void)setPinned:(BOOL)a3;
- (void)setReaderScrollPosition:(id)a3;
- (void)setSceneID:(id)a3;
- (void)setShowingReader:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation WBSCloudTabParameters

- (void)setTitle:(id)a3
{
}

- (void)setShowingReader:(BOOL)a3
{
  self->_showingReader = a3;
}

- (void)setReaderScrollPosition:(id)a3
{
}

- (void)setLastViewedTime:(double)a3
{
  self->_lastViewedTime = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (NSDictionary)readerScrollPosition
{
  return self->_readerScrollPosition;
}

- (double)lastViewedTime
{
  return self->_lastViewedTime;
}

- (BOOL)isShowingReader
{
  return self->_showingReader;
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
  objc_storeStrong((id *)&self->_readerScrollPosition, 0);
}

- (WBSCloudTabParameters)initWithURL:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSCloudTabParameters;
  v6 = [(WBSCloudTabParameters *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = v7;
  }

  return v7;
}

- (void)setPinned:(BOOL)a3
{
  self->_pinned = a3;
}

- (void)setSceneID:(id)a3
{
}

- (void)setUrl:(id)a3
{
}

- (void)setUuid:(id)a3
{
}

@end