@interface FCHLSGroup
- (id)description;
@end

@implementation FCHLSGroup

- (id)description
{
  v2 = NSString;
  if (self)
  {
    v4 = self->_groupID;
    media = self->_media;
  }
  else
  {
    v4 = 0;
    media = 0;
  }
  v6 = media;
  v7 = [(NSArray *)v6 description];
  v8 = [v2 stringWithFormat:@"GroupID: %@ %@", v4, v7];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_media, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
}

@end