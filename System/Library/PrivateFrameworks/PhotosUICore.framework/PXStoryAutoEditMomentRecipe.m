@interface PXStoryAutoEditMomentRecipe
- ($7F31FC32F9D1B293069C8DA058A10F41)incomingTransition;
- ($7F31FC32F9D1B293069C8DA058A10F41)innerTransition;
- ($BE932F7424ADCBB9629B4717D8D69A02)motion;
- (PXStoryAutoEditMomentRecipe)init;
- (PXStoryAutoEditMomentRecipe)initWithRecipeType:(unint64_t)a3 incomingTransition:(id *)a4 innerTransition:(id *)a5 motion:(id *)a6;
- (id)description;
- (unint64_t)recipeType;
@end

@implementation PXStoryAutoEditMomentRecipe

- ($BE932F7424ADCBB9629B4717D8D69A02)motion
{
  *($A26D059FEF5EDA5B5A36800E99FED223 *)retstr = *($A26D059FEF5EDA5B5A36800E99FED223 *)(&self->var1.var2 + 1);
  return self;
}

- ($7F31FC32F9D1B293069C8DA058A10F41)innerTransition
{
  $3913CBCB8C27C6162DFA06D9B9422DBB v3 = *($3913CBCB8C27C6162DFA06D9B9422DBB *)((char *)&self[2].var2 + 8);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var1;
  retstr->var2 = v3;
  return self;
}

- ($7F31FC32F9D1B293069C8DA058A10F41)incomingTransition
{
  $3913CBCB8C27C6162DFA06D9B9422DBB v3 = *($3913CBCB8C27C6162DFA06D9B9422DBB *)((char *)&self[1].var2 + 8);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var1;
  retstr->var2 = v3;
  return self;
}

- (unint64_t)recipeType
{
  return self->_recipeType;
}

- (id)description
{
  $3913CBCB8C27C6162DFA06D9B9422DBB v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t recipeType = self->_recipeType;
  if (recipeType > 8) {
    v6 = @"??";
  }
  else {
    v6 = off_1E5DB4FB0[recipeType];
  }
  [(PXStoryAutoEditMomentRecipe *)self incomingTransition];
  v7 = PXStoryAutoEditClipTransitionInfoDescription((uint64_t)v14);
  [(PXStoryAutoEditMomentRecipe *)self innerTransition];
  v8 = PXStoryAutoEditClipTransitionInfoDescription((uint64_t)v13);
  [(PXStoryAutoEditMomentRecipe *)self motion];
  v9 = PXStoryAutoEditClipMotionInfoDescription(&v12);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; type:%@, incoming:%@, inner:%@, motion:%@",
    v4,
    self,
    v6,
    v7,
    v8,
  v10 = v9);

  return v10;
}

- (PXStoryAutoEditMomentRecipe)initWithRecipeType:(unint64_t)a3 incomingTransition:(id *)a4 innerTransition:(id *)a5 motion:(id *)a6
{
  v14.receiver = self;
  v14.super_class = (Class)PXStoryAutoEditMomentRecipe;
  result = [(PXStoryAutoEditMomentRecipe *)&v14 init];
  if (result)
  {
    result->_unint64_t recipeType = a3;
    long long v11 = *(_OWORD *)&a4->var0;
    result->_incomingTransition.settings = ($BBBBDEA97CC73616CCE2EBA454CAEC53)a4->var2;
    *(_OWORD *)&result->_incomingTransition.kind = v11;
    long long v12 = *(_OWORD *)&a5->var0;
    result->_innerTransition.settings = ($BBBBDEA97CC73616CCE2EBA454CAEC53)a5->var2;
    *(_OWORD *)&result->_innerTransition.kind = v12;
    long long v13 = *(_OWORD *)&a6->var0;
    result->_motion.settings.pan.relativeMotion = a6->var1.var0.var1;
    *(_OWORD *)&result->_motion.style = v13;
  }
  return result;
}

- (PXStoryAutoEditMomentRecipe)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryAutoEditClip.m", 417, @"%s is not available as initializer", "-[PXStoryAutoEditMomentRecipe init]");

  abort();
}

@end