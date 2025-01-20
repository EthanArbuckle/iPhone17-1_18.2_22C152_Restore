@interface SKUIImagePlaceholder
- (SKUIImagePlaceholder)initWithBackgroundColor:(id)a3 borderColor:(id)a4 borderWidth:(double)a5 cornerPathBlock:(id)a6;
- (SKUIImagePlaceholder)initWithBackgroundColor:(id)a3 borderColor:(id)a4 borderWidth:(double)a5 cornerRadius:(double)a6;
- (UIColor)backgroundColor;
- (UIColor)borderColor;
- (double)borderWidth;
- (id)cornerPathBlock;
@end

@implementation SKUIImagePlaceholder

- (SKUIImagePlaceholder)initWithBackgroundColor:(id)a3 borderColor:(id)a4 borderWidth:(double)a5 cornerRadius:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIImagePlaceholder initWithBackgroundColor:borderColor:borderWidth:cornerRadius:]();
  }
  if (a6 >= 0.00000011920929)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __SKUIImagePlaceholderCornerPathBlockCreate_block_invoke_2;
    aBlock[3] = &__block_descriptor_40_e53___UIBezierPath_40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
    *(double *)&aBlock[4] = a6;
    v12 = _Block_copy(aBlock);
  }
  else if (a5 >= 0.00000011920929)
  {
    v12 = &__block_literal_global_55;
  }
  else
  {
    v12 = 0;
  }
  v13 = [(SKUIImagePlaceholder *)self initWithBackgroundColor:v10 borderColor:v11 borderWidth:v12 cornerPathBlock:a5];

  return v13;
}

- (SKUIImagePlaceholder)initWithBackgroundColor:(id)a3 borderColor:(id)a4 borderWidth:(double)a5 cornerPathBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIImagePlaceholder initWithBackgroundColor:borderColor:borderWidth:cornerPathBlock:]();
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIImagePlaceholder;
  v14 = [(SKUIImagePlaceholder *)&v19 init];
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

- (void)initWithBackgroundColor:borderColor:borderWidth:cornerRadius:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIImagePlaceholder initWithBackgroundColor:borderColor:borderWidth:cornerRadius:]";
}

- (void)initWithBackgroundColor:borderColor:borderWidth:cornerPathBlock:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIImagePlaceholder initWithBackgroundColor:borderColor:borderWidth:cornerPathBlock:]";
}

@end