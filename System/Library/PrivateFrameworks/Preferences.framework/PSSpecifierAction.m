@interface PSSpecifierAction
+ (PSSpecifierAction)actionWithBoolDetailClass:(Class)a3;
+ (PSSpecifierAction)actionWithGetter:(id)a3 setter:(id)a4;
+ (PSSpecifierAction)actionWithTarget:(id)a3 getterSelector:(SEL)a4 setterSelector:(SEL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getter;
- (id)setter;
- (void)setGetter:(id)a3;
- (void)setSetter:(id)a3;
@end

@implementation PSSpecifierAction

+ (PSSpecifierAction)actionWithGetter:(id)a3 setter:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setGetter:v6];

  [v7 setSetter:v5];
  return (PSSpecifierAction *)v7;
}

+ (PSSpecifierAction)actionWithTarget:(id)a3 getterSelector:(SEL)a4 setterSelector:(SEL)a5
{
  objc_initWeak(&location, a3);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__PSSpecifierAction_actionWithTarget_getterSelector_setterSelector___block_invoke;
  v12[3] = &unk_1E5C5FEB0;
  v13[1] = (id)a4;
  objc_copyWeak(v13, &location);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__PSSpecifierAction_actionWithTarget_getterSelector_setterSelector___block_invoke_2;
  v10[3] = &unk_1E5C5FED8;
  v11[1] = (id)a5;
  objc_copyWeak(v11, &location);
  v8 = [a1 actionWithGetter:v12 setter:v10];
  objc_destroyWeak(v11);
  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
  return (PSSpecifierAction *)v8;
}

id __68__PSSpecifierAction_actionWithTarget_getterSelector_setterSelector___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = SFPerformSelector();

  return v2;
}

void __68__PSSpecifierAction_actionWithTarget_getterSelector_setterSelector___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = (id)SFPerformSelector2();
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getter
{
  return self->_getter;
}

- (void)setGetter:(id)a3
{
}

- (id)setter
{
  return self->_setter;
}

- (void)setSetter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_setter, 0);
  objc_storeStrong(&self->_getter, 0);
}

+ (PSSpecifierAction)actionWithBoolDetailClass:(Class)a3
{
  if ([(objc_class *)a3 conformsToProtocol:&unk_1EFBC2650])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__PSSpecifierAction_Convenience__actionWithBoolDetailClass___block_invoke;
    v8[3] = &__block_descriptor_40_e21__16__0__PSSpecifier_8lu32l8;
    v8[4] = a3;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__PSSpecifierAction_Convenience__actionWithBoolDetailClass___block_invoke_2;
    v7[3] = &__block_descriptor_40_e24_v24__0__PSSpecifier_8_16lu32l8;
    v7[4] = a3;
    id v5 = [a1 actionWithGetter:v8 setter:v7];
  }
  else
  {
    id v5 = 0;
  }
  return (PSSpecifierAction *)v5;
}

uint64_t __60__PSSpecifierAction_Convenience__actionWithBoolDetailClass___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v2 = [*(id *)(a1 + 32) isEnabled];
  return [v1 numberWithBool:v2];
}

uint64_t __60__PSSpecifierAction_Convenience__actionWithBoolDetailClass___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = [a3 BOOLValue];
  return [v3 setEnabled:v4];
}

@end