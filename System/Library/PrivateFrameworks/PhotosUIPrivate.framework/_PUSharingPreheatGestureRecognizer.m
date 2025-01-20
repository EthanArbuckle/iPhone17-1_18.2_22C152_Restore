@interface _PUSharingPreheatGestureRecognizer
- (_PUSharingPreheatGestureRecognizer)initWithSharingPreheatBlock:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation _PUSharingPreheatGestureRecognizer

- (void).cxx_destruct
{
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_PUSharingPreheatGestureRecognizer;
  [(_PUSharingPreheatGestureRecognizer *)&v6 touchesBegan:a3 withEvent:a4];
  sharingPreheatBlock = (void (**)(void))self->_sharingPreheatBlock;
  if (sharingPreheatBlock) {
    sharingPreheatBlock[2]();
  }
  [(_PUSharingPreheatGestureRecognizer *)self setState:5];
}

- (_PUSharingPreheatGestureRecognizer)initWithSharingPreheatBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PUSharingPreheatGestureRecognizer;
  v5 = [(_PUSharingPreheatGestureRecognizer *)&v9 initWithTarget:0 action:0];
  if (v5)
  {
    objc_super v6 = _Block_copy(v4);
    id sharingPreheatBlock = v5->_sharingPreheatBlock;
    v5->_id sharingPreheatBlock = v6;
  }
  return v5;
}

@end