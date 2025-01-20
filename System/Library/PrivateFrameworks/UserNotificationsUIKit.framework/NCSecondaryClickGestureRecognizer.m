@interface NCSecondaryClickGestureRecognizer
- (BOOL)isSecondaryClickEvent:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation NCSecondaryClickGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NCSecondaryClickGestureRecognizer;
  id v6 = a4;
  [(NCSecondaryClickGestureRecognizer *)&v8 touchesBegan:a3 withEvent:v6];
  LODWORD(a3) = -[NCSecondaryClickGestureRecognizer isSecondaryClickEvent:](self, "isSecondaryClickEvent:", v6, v8.receiver, v8.super_class);

  if (a3) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 5;
  }
  [(NCSecondaryClickGestureRecognizer *)self setState:v7];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NCSecondaryClickGestureRecognizer;
  id v6 = a4;
  [(NCSecondaryClickGestureRecognizer *)&v7 touchesEnded:a3 withEvent:v6];
  LODWORD(a3) = -[NCSecondaryClickGestureRecognizer isSecondaryClickEvent:](self, "isSecondaryClickEvent:", v6, v7.receiver, v7.super_class);

  if (a3) {
    [(NCSecondaryClickGestureRecognizer *)self setState:3];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NCSecondaryClickGestureRecognizer;
  id v6 = a4;
  [(NCSecondaryClickGestureRecognizer *)&v7 touchesCancelled:a3 withEvent:v6];
  LODWORD(a3) = -[NCSecondaryClickGestureRecognizer isSecondaryClickEvent:](self, "isSecondaryClickEvent:", v6, v7.receiver, v7.super_class);

  if (a3) {
    [(NCSecondaryClickGestureRecognizer *)self setState:4];
  }
}

- (BOOL)isSecondaryClickEvent:(id)a3
{
  return ((unint64_t)[a3 buttonMask] >> 1) & 1;
}

@end