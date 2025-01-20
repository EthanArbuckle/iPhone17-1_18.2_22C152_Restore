@interface TUICandidateLine
+ (id)reuseIdentifier;
- (TUICandidateViewStyle)style;
- (void)setStyle:(id)a3;
@end

@implementation TUICandidateLine

+ (id)reuseIdentifier
{
  return @"TUICandidateLine";
}

- (void).cxx_destruct
{
}

- (TUICandidateViewStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  id v6 = a3;
  if ((-[TUICandidateViewStyle isEqual:](self->_style, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_style, a3);
    v5 = [v6 lineColor];
    [(TUICandidateLine *)self setBackgroundColor:v5];
  }
}

@end