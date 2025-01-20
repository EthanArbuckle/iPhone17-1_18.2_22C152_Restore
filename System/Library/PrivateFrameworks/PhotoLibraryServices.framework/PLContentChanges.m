@interface PLContentChanges
- (NSMutableArray)container;
- (NSMutableArray)updatedContent;
- (void)cleanupState;
- (void)setContainer:(id)a3;
- (void)setUpdatedContent:(id)a3;
@end

@implementation PLContentChanges

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedContent, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

- (void)setUpdatedContent:(id)a3
{
}

- (NSMutableArray)updatedContent
{
  return self->_updatedContent;
}

- (void)setContainer:(id)a3
{
}

- (NSMutableArray)container
{
  return self->_container;
}

- (void)cleanupState
{
  container = self->_container;
  self->_container = 0;

  updatedContent = self->_updatedContent;
  self->_updatedContent = 0;
}

@end