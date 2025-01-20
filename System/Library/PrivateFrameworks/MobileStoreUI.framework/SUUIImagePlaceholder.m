@interface SUUIImagePlaceholder
- (SUUIImagePlaceholder)initWithBackgroundColor:(id)a3 borderColor:(id)a4 borderWidth:(double)a5 cornerPathBlock:(id)a6;
- (SUUIImagePlaceholder)initWithBackgroundColor:(id)a3 borderColor:(id)a4 borderWidth:(double)a5 cornerRadius:(double)a6;
- (UIColor)backgroundColor;
- (UIColor)borderColor;
- (double)borderWidth;
- (id)cornerPathBlock;
@end

@implementation SUUIImagePlaceholder

- (SUUIImagePlaceholder)initWithBackgroundColor:(id)a3 borderColor:(id)a4 borderWidth:(double)a5 cornerRadius:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  if (a6 >= 0.00000011920929)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __SUUIImagePlaceholderCornerPathBlockCreate_block_invoke_2;
    aBlock[3] = &__block_descriptor_40_e53___UIBezierPath_40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
    *(double *)&aBlock[4] = a6;
    v12 = _Block_copy(aBlock);
  }
  else if (a5 >= 0.00000011920929)
  {
    v12 = &__block_literal_global_54;
  }
  else
  {
    v12 = 0;
  }
  v13 = [(SUUIImagePlaceholder *)self initWithBackgroundColor:v10 borderColor:v11 borderWidth:v12 cornerPathBlock:a5];

  return v13;
}

- (SUUIImagePlaceholder)initWithBackgroundColor:(id)a3 borderColor:(id)a4 borderWidth:(double)a5 cornerPathBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SUUIImagePlaceholder;
  v14 = [(SUUIImagePlaceholder *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_backgroundColor, a3);
    objc_storeStrong((id *)&v15->_borderColor, a4);
    v15->_borderWidth = a5;
    uint64_t v16 = [v13 copy];
    id cornerPathBlock = v15->_cornerPathBlock;
    v15->_id cornerPathBlock = (id)v16;
  }
  return v15;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (id)cornerPathBlock
{
  return self->_cornerPathBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cornerPathBlock, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end