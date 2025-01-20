@interface SXAXCustomRotor
+ (id)rotorWithName:(id)a3;
- (NSOrderedSet)rotorItems;
- (SXAXCustomRotor)initWithName:(id)a3;
- (id)description;
- (id)rotorItemAfter:(id)a3;
- (id)rotorItemBefore:(id)a3;
- (int64_t)indexOfRotorItem:(id)a3;
- (void)setRotorItems:(id)a3;
@end

@implementation SXAXCustomRotor

+ (id)rotorWithName:(id)a3
{
  id v3 = a3;
  v4 = (void *)__rotors;
  if (!__rotors)
  {
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    v6 = (void *)__rotors;
    __rotors = v5;

    v4 = (void *)__rotors;
  }
  v7 = [v4 objectForKey:v3];
  if (!v7)
  {
    v7 = [[SXAXCustomRotor alloc] initWithName:v3];
    [(id)__rotors setObject:v7 forKey:v3];
  }

  return v7;
}

- (SXAXCustomRotor)initWithName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SXAXCustomRotor;
  uint64_t v5 = [(SXAXCustomRotor *)&v10 initWithName:v4 itemSearchBlock:&__block_literal_global_59];
  objc_initWeak(&location, v5);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__SXAXCustomRotor_initWithName___block_invoke_2;
  v7[3] = &unk_264653310;
  objc_copyWeak(&v8, &location);
  [(SXAXCustomRotor *)v5 setItemSearchBlock:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

uint64_t __32__SXAXCustomRotor_initWithName___block_invoke()
{
  return 0;
}

id __32__SXAXCustomRotor_initWithName___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 searchDirection];
  if (v4 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v6 = [v3 currentItem];
    uint64_t v7 = [WeakRetained rotorItemAfter:v6];
    goto LABEL_5;
  }
  if (!v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v6 = [v3 currentItem];
    uint64_t v7 = [WeakRetained rotorItemBefore:v6];
LABEL_5:
    id v8 = (void *)v7;

    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:

  return v8;
}

- (id)rotorItemBefore:(id)a3
{
  uint64_t v4 = [(SXAXCustomRotor *)self indexOfRotorItem:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [(SXAXCustomRotor *)self rotorItems];
    v6 = [(SXAXCustomRotor *)self rotorItems];
    uint64_t v7 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v6, "count") - 1);

LABEL_5:
    goto LABEL_7;
  }
  uint64_t v8 = v4 - 1;
  if (v4 >= 1)
  {
    uint64_t v5 = [(SXAXCustomRotor *)self rotorItems];
    uint64_t v7 = [v5 objectAtIndexedSubscript:v8];
    goto LABEL_5;
  }
  uint64_t v7 = 0;
LABEL_7:
  v9 = [v7 targetElement];

  if (!v9)
  {

    uint64_t v7 = 0;
  }
  return v7;
}

- (id)rotorItemAfter:(id)a3
{
  int64_t v4 = [(SXAXCustomRotor *)self indexOfRotorItem:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [(SXAXCustomRotor *)self rotorItems];
    v6 = v5;
    unint64_t v7 = 0;
LABEL_5:
    v11 = [v5 objectAtIndexedSubscript:v7];

    goto LABEL_7;
  }
  unint64_t v8 = v4 + 1;
  v9 = [(SXAXCustomRotor *)self rotorItems];
  unint64_t v10 = [v9 count];

  if (v8 < v10)
  {
    uint64_t v5 = [(SXAXCustomRotor *)self rotorItems];
    v6 = v5;
    unint64_t v7 = v8;
    goto LABEL_5;
  }
  v11 = 0;
LABEL_7:
  v12 = [v11 targetElement];

  if (!v12)
  {

    v11 = 0;
  }
  return v11;
}

- (int64_t)indexOfRotorItem:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v5 = [(SXAXCustomRotor *)self rotorItems];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __36__SXAXCustomRotor_indexOfRotorItem___block_invoke;
  v9[3] = &unk_264653338;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  int64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __36__SXAXCustomRotor_indexOfRotorItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  int64_t v7 = [*(id *)(a1 + 32) targetElement];
  unint64_t v8 = [v16 targetElement];
  int v9 = [v7 isEqual:v8];

  id v10 = [*(id *)(a1 + 32) targetRange];
  if (v10)
  {
  }
  else
  {
    v11 = [v16 targetRange];

    if (!v11)
    {
      char v15 = 0;
      if (!v9) {
        goto LABEL_7;
      }
      goto LABEL_5;
    }
  }
  uint64_t v12 = [*(id *)(a1 + 32) targetRange];
  v13 = [v16 targetRange];
  char v14 = [v12 isEqual:v13];

  char v15 = v14 ^ 1;
  if (!v9) {
    goto LABEL_7;
  }
LABEL_5:
  if ((v15 & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
LABEL_7:
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [(SXAXCustomRotor *)self name];
  int64_t v7 = [(SXAXCustomRotor *)self rotorItems];
  unint64_t v8 = [v3 stringWithFormat:@"<%@: %p %@; items={%@}>", v5, self, v6, v7];;

  return v8;
}

- (NSOrderedSet)rotorItems
{
  return self->_rotorItems;
}

- (void)setRotorItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end