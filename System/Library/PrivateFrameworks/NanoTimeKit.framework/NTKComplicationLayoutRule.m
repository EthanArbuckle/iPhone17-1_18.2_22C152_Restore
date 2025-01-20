@interface NTKComplicationLayoutRule
+ (id)layoutRuleForDevice:(id)a3 withReferenceFrame:(CGRect)a4 horizontalLayout:(int64_t)a5 verticalLayout:(int64_t)a6 keylinePadding:(UIEdgeInsets)a7;
+ (id)layoutRuleForDevice:(id)a3 withReferenceFrame:(CGRect)a4 horizontalLayout:(int64_t)a5 verticalLayout:(int64_t)a6 keylinePadding:(UIEdgeInsets)a7 clip:(BOOL)a8;
+ (id)layoutRuleForDevice:(id)a3 withReferenceFrame:(CGRect)a4 horizontalLayout:(int64_t)a5 verticalLayout:(int64_t)a6 keylinePadding:(UIEdgeInsets)a7 clip:(BOOL)a8 contentTransform:(CGAffineTransform *)a9;
+ (id)layoutRuleForDevice:(id)a3 withReferenceFrame:(CGRect)a4 horizontalLayout:(int64_t)a5 verticalLayout:(int64_t)a6 keylinePadding:(UIEdgeInsets)a7 clip:(BOOL)a8 editingTransform:(CGAffineTransform *)a9;
- (BOOL)isEqual:(id)a3;
- (CGAffineTransform)contentTransform;
- (CGAffineTransform)editingTransform;
- (UIEdgeInsets)keylinePadding;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForDevice:(id)a3;
- (unint64_t)hash;
- (void)setContentTransform:(CGAffineTransform *)a3;
- (void)setEditingTransform:(CGAffineTransform *)a3;
@end

@implementation NTKComplicationLayoutRule

- (id)initForDevice:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKComplicationLayoutRule;
  id result = [(NTKLayoutRule *)&v8 initForDevice:a3];
  if (result)
  {
    uint64_t v4 = MEMORY[0x1E4F1DAB8];
    long long v5 = *MEMORY[0x1E4F1DAB8];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)((char *)result + 104) = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)((char *)result + 120) = v6;
    long long v7 = *(_OWORD *)(v4 + 32);
    *(_OWORD *)((char *)result + 136) = v7;
    *(_OWORD *)((char *)result + 168) = v6;
    *(_OWORD *)((char *)result + 184) = v7;
    *(_OWORD *)((char *)result + 152) = v5;
  }
  return result;
}

+ (id)layoutRuleForDevice:(id)a3 withReferenceFrame:(CGRect)a4 horizontalLayout:(int64_t)a5 verticalLayout:(int64_t)a6 keylinePadding:(UIEdgeInsets)a7
{
  CGFloat right = a7.right;
  CGFloat bottom = a7.bottom;
  CGFloat left = a7.left;
  CGFloat top = a7.top;
  id result = (id)objc_msgSend(a1, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:", a3, a5, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  *((CGFloat *)result + 9) = top;
  *((CGFloat *)result + 10) = left;
  *((CGFloat *)result + 11) = bottom;
  *((CGFloat *)result + 12) = right;
  return result;
}

+ (id)layoutRuleForDevice:(id)a3 withReferenceFrame:(CGRect)a4 horizontalLayout:(int64_t)a5 verticalLayout:(int64_t)a6 keylinePadding:(UIEdgeInsets)a7 clip:(BOOL)a8
{
  CGFloat right = a7.right;
  CGFloat bottom = a7.bottom;
  CGFloat left = a7.left;
  CGFloat top = a7.top;
  id result = (id)objc_msgSend(a1, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:clip:", a3, a5, a6, a8, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  *((CGFloat *)result + 9) = top;
  *((CGFloat *)result + 10) = left;
  *((CGFloat *)result + 11) = bottom;
  *((CGFloat *)result + 12) = right;
  return result;
}

+ (id)layoutRuleForDevice:(id)a3 withReferenceFrame:(CGRect)a4 horizontalLayout:(int64_t)a5 verticalLayout:(int64_t)a6 keylinePadding:(UIEdgeInsets)a7 clip:(BOOL)a8 editingTransform:(CGAffineTransform *)a9
{
  id result = (id)objc_msgSend(a1, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", a3, a5, a6, a8, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a7.top, a7.left, a7.bottom, a7.right);
  long long v12 = *(_OWORD *)&a9->c;
  long long v11 = *(_OWORD *)&a9->tx;
  *(_OWORD *)((char *)result + 104) = *(_OWORD *)&a9->a;
  *(_OWORD *)((char *)result + 120) = v12;
  *(_OWORD *)((char *)result + 136) = v11;
  return result;
}

+ (id)layoutRuleForDevice:(id)a3 withReferenceFrame:(CGRect)a4 horizontalLayout:(int64_t)a5 verticalLayout:(int64_t)a6 keylinePadding:(UIEdgeInsets)a7 clip:(BOOL)a8 contentTransform:(CGAffineTransform *)a9
{
  id result = (id)objc_msgSend(a1, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", a3, a5, a6, a8, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a7.top, a7.left, a7.bottom, a7.right);
  long long v12 = *(_OWORD *)&a9->c;
  long long v11 = *(_OWORD *)&a9->tx;
  *(_OWORD *)((char *)result + 152) = *(_OWORD *)&a9->a;
  *(_OWORD *)((char *)result + 168) = v12;
  *(_OWORD *)((char *)result + 184) = v11;
  return result;
}

- (unint64_t)hash
{
  v14.receiver = self;
  v14.super_class = (Class)NTKComplicationLayoutRule;
  double v3 = round(self->_keylinePadding.bottom * 1000000.0)
     + (double)[(NTKLayoutRule *)&v14 hash]
     + round(self->_keylinePadding.left * 10000000.0)
     + round(self->_keylinePadding.right * 100000000.0)
     + round(self->_keylinePadding.top * 1000000000.0);
  long long v4 = *(_OWORD *)&self->_editingTransform.c;
  long long v11 = *(_OWORD *)&self->_editingTransform.a;
  long long v12 = v4;
  long long v13 = *(_OWORD *)&self->_editingTransform.tx;
  long long v5 = [MEMORY[0x1E4F29238] valueWithCGAffineTransform:&v11];
  double v6 = v3 + (double)(unint64_t)[v5 hash] * 1.0e10;
  long long v7 = *(_OWORD *)&self->_contentTransform.c;
  long long v11 = *(_OWORD *)&self->_contentTransform.a;
  long long v12 = v7;
  long long v13 = *(_OWORD *)&self->_contentTransform.tx;
  objc_super v8 = [MEMORY[0x1E4F29238] valueWithCGAffineTransform:&v11];
  unint64_t v9 = (unint64_t)(v6 + (double)(unint64_t)[v8 hash] * 1.0e11);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NTKComplicationLayoutRule;
  if (![(NTKLayoutRule *)&v20 isEqual:v4]) {
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_20;
  }
  [v4 keylinePadding];
  BOOL v9 = self->_keylinePadding.left == v8 && self->_keylinePadding.top == v5;
  BOOL v10 = v9 && self->_keylinePadding.right == v7;
  if (!v10 || self->_keylinePadding.bottom != v6) {
    goto LABEL_20;
  }
  if (v4) {
    [v4 editingTransform];
  }
  else {
    memset(&t2, 0, sizeof(t2));
  }
  long long v12 = *(_OWORD *)&self->_editingTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_editingTransform.a;
  *(_OWORD *)&t1.c = v12;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_editingTransform.tx;
  if (CGAffineTransformEqualToTransform(&t1, &t2))
  {
    p_contentTransform = &self->_contentTransform;
    if (v4) {
      [v4 contentTransform];
    }
    else {
      memset(&v17, 0, sizeof(v17));
    }
    long long v16 = *(_OWORD *)&p_contentTransform->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&p_contentTransform->a;
    *(_OWORD *)&t1.c = v16;
    *(_OWORD *)&t1.tx = *(_OWORD *)&p_contentTransform->tx;
    BOOL v14 = CGAffineTransformEqualToTransform(&t1, &v17);
  }
  else
  {
LABEL_20:
    BOOL v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NTKComplicationLayoutRule;
  id result = [(NTKLayoutRule *)&v10 copyWithZone:a3];
  long long v5 = *(_OWORD *)&self->_keylinePadding.bottom;
  *(_OWORD *)((char *)result + 72) = *(_OWORD *)&self->_keylinePadding.top;
  *(_OWORD *)((char *)result + 88) = v5;
  long long v6 = *(_OWORD *)&self->_editingTransform.a;
  long long v7 = *(_OWORD *)&self->_editingTransform.tx;
  *(_OWORD *)((char *)result + 120) = *(_OWORD *)&self->_editingTransform.c;
  *(_OWORD *)((char *)result + 136) = v7;
  *(_OWORD *)((char *)result + 104) = v6;
  long long v8 = *(_OWORD *)&self->_contentTransform.tx;
  long long v9 = *(_OWORD *)&self->_contentTransform.a;
  *(_OWORD *)((char *)result + 168) = *(_OWORD *)&self->_contentTransform.c;
  *(_OWORD *)((char *)result + 184) = v8;
  *(_OWORD *)((char *)result + 152) = v9;
  return result;
}

- (UIEdgeInsets)keylinePadding
{
  double top = self->_keylinePadding.top;
  double left = self->_keylinePadding.left;
  double bottom = self->_keylinePadding.bottom;
  double right = self->_keylinePadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGAffineTransform)editingTransform
{
  long long v3 = *(_OWORD *)&self[2].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].ty;
  return self;
}

- (void)setEditingTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_editingTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_editingTransform.c = v4;
  *(_OWORD *)&self->_editingTransform.tx = v3;
}

- (CGAffineTransform)contentTransform
{
  long long v3 = *(_OWORD *)&self[3].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].ty;
  return self;
}

- (void)setContentTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_contentTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_contentTransform.c = v4;
  *(_OWORD *)&self->_contentTransform.tx = v3;
}

@end