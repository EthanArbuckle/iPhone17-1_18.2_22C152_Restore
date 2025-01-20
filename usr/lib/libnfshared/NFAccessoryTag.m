@interface NFAccessoryTag
- (NFAccessoryTag)init;
- (NFAccessoryTag)initWithDelegate:(id)a3;
- (NFAccessoryTagDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation NFAccessoryTag

- (NFAccessoryTag)init
{
  return 0;
}

- (NFAccessoryTag)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NFAccessoryTag;
  v5 = [(NFAccessoryTag *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (NFAccessoryTagDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NFAccessoryTagDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end