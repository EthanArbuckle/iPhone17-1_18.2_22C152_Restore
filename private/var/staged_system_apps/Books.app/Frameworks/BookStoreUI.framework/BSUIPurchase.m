@interface BSUIPurchase
- (BOOL)isAudioBook;
- (NSString)identifier;
- (void)setIdentifier:(id)a3;
- (void)setIsAudioBook:(BOOL)a3;
@end

@implementation BSUIPurchase

- (BOOL)isAudioBook
{
  return self->_isAudioBook;
}

- (void)setIsAudioBook:(BOOL)a3
{
  self->_isAudioBook = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end