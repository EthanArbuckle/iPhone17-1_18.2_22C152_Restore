@interface PDPassTileManager
- (PDPassTileManager)init;
@end

@implementation PDPassTileManager

- (PDPassTileManager)init
{
  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_descriptorStateParticipants, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_cardFileManager, 0);
}

@end