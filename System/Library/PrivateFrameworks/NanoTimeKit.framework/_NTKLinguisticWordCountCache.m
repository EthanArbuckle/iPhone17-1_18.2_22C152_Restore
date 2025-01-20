@interface _NTKLinguisticWordCountCache
- (NSString)text;
- (unint64_t)number;
- (void)setNumber:(unint64_t)a3;
- (void)setText:(id)a3;
@end

@implementation _NTKLinguisticWordCountCache

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (unint64_t)number
{
  return self->_number;
}

- (void)setNumber:(unint64_t)a3
{
  self->_number = a3;
}

- (void).cxx_destruct
{
}

@end