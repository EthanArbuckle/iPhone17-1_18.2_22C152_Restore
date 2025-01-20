@interface _TUISecondaryTapGestureRecognizer
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _TUISecondaryTapGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v12 = a4;
  id v5 = [(_TUISecondaryTapGestureRecognizer *)self state];
  v6 = v12;
  if (!v5)
  {
    id v7 = v12;
    v8 = (char *)[v7 buttonMask];
    BOOL v9 = [v7 buttonMask] == (char *)&def_141F14 + 1 && [v7 modifierFlags] == &loc_40000;
    int v10 = v8 == (unsigned char *)&def_141F14 + 2 || v9;

    if (v10) {
      uint64_t v11 = 3;
    }
    else {
      uint64_t v11 = 5;
    }
    [(_TUISecondaryTapGestureRecognizer *)self setState:v11];
    v6 = v12;
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  if ([(_TUISecondaryTapGestureRecognizer *)self state] == (char *)&def_141F14 + 1
    || [(_TUISecondaryTapGestureRecognizer *)self state] == (char *)&def_141F14 + 2)
  {
    [(_TUISecondaryTapGestureRecognizer *)self setState:2];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if ([(_TUISecondaryTapGestureRecognizer *)self state] == (char *)&def_141F14 + 1
    || [(_TUISecondaryTapGestureRecognizer *)self state] == (char *)&def_141F14 + 2)
  {
    [(_TUISecondaryTapGestureRecognizer *)self setState:3];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if ((uint64_t)[(_TUISecondaryTapGestureRecognizer *)self state] > 0) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 5;
  }

  [(_TUISecondaryTapGestureRecognizer *)self setState:v5];
}

@end