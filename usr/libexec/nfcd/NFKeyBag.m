@interface NFKeyBag
- (NFKeyBag)init;
@end

@implementation NFKeyBag

- (NFKeyBag)init
{
  v5.receiver = self;
  v5.super_class = (Class)NFKeyBag;
  v2 = [(NFKeyBag *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_notifyToken = -1;
    *(_WORD *)&v2->_hasBeenUnlocked = 0;
    v2->_isLocked = 0;
    sub_100200B8C(v2);
  }
  return v3;
}

- (void).cxx_destruct
{
}

@end