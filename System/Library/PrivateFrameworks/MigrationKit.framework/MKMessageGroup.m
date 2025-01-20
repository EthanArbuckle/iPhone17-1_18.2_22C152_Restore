@interface MKMessageGroup
- (MKMessageGroup)init;
- (NSString)ID;
- (NSString)roomName;
- (void)setID:(id)a3;
- (void)setRoomName:(id)a3;
@end

@implementation MKMessageGroup

- (MKMessageGroup)init
{
  v7.receiver = self;
  v7.super_class = (Class)MKMessageGroup;
  v2 = [(MKMessageGroup *)&v7 init];
  if (v2)
  {
    v3 = [NSString generatedRoomNameForGroupChat];
    [(MKMessageGroup *)v2 setRoomName:v3];

    v4 = [MEMORY[0x263F08C38] UUID];
    v5 = [v4 UUIDString];
    [(MKMessageGroup *)v2 setID:v5];
  }
  return v2;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setRoomName:(id)a3
{
}

- (NSString)ID
{
  return self->_ID;
}

- (void)setID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ID, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
}

@end