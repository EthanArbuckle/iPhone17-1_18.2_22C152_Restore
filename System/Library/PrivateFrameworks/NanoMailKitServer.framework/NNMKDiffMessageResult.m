@interface NNMKDiffMessageResult
- (BOOL)trimed;
- (NSArray)messageToAddToWatch;
- (NSMutableSet)messageIdsToAddToWatch;
- (NSMutableSet)messageIdsToDeleteFromWatch;
- (NSMutableSet)messageIdsToUpdateOnWatch;
- (void)setMessageIdsToAddToWatch:(id)a3;
- (void)setMessageIdsToDeleteFromWatch:(id)a3;
- (void)setMessageIdsToUpdateOnWatch:(id)a3;
- (void)setMessageToAddToWatch:(id)a3;
- (void)setTrimed:(BOOL)a3;
@end

@implementation NNMKDiffMessageResult

- (NSMutableSet)messageIdsToAddToWatch
{
  return self->_messageIdsToAddToWatch;
}

- (void)setMessageIdsToAddToWatch:(id)a3
{
}

- (NSMutableSet)messageIdsToUpdateOnWatch
{
  return self->_messageIdsToUpdateOnWatch;
}

- (void)setMessageIdsToUpdateOnWatch:(id)a3
{
}

- (NSMutableSet)messageIdsToDeleteFromWatch
{
  return self->_messageIdsToDeleteFromWatch;
}

- (void)setMessageIdsToDeleteFromWatch:(id)a3
{
}

- (NSArray)messageToAddToWatch
{
  return self->_messageToAddToWatch;
}

- (void)setMessageToAddToWatch:(id)a3
{
}

- (BOOL)trimed
{
  return self->_trimed;
}

- (void)setTrimed:(BOOL)a3
{
  self->_trimed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageToAddToWatch, 0);
  objc_storeStrong((id *)&self->_messageIdsToDeleteFromWatch, 0);
  objc_storeStrong((id *)&self->_messageIdsToUpdateOnWatch, 0);
  objc_storeStrong((id *)&self->_messageIdsToAddToWatch, 0);
}

@end