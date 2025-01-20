@interface PPSocialHighlightStoreHandler
@end

@implementation PPSocialHighlightStoreHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sem, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end