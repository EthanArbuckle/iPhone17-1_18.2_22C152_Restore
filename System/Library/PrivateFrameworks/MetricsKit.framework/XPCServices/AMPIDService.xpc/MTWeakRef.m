@interface MTWeakRef
- (id)value;
- (void)setValue:(id)a3;
@end

@implementation MTWeakRef

- (id)value
{
  id WeakRetained = objc_loadWeakRetained(&self->_value);

  return WeakRetained;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end