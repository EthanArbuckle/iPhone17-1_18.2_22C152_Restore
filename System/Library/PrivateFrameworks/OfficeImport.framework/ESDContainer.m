@interface ESDContainer
+ (void)pbReadChildrenOfObject:(EshObject *)a3 toArray:(id)a4 state:(id)a5;
+ (void)readChildrenOfObject:(EshObject *)a3 reader:(OcReader *)a4 toArray:(id)a5;
- (ESDContainer)initWithEshObject:(EshObject *)a3;
- (EshObject)addAtomChildOfType:(unsigned __int16)a3;
- (EshObject)addPptAtomChildOfType:(unsigned __int16)a3;
- (id)addChildOfType:(unsigned __int16)a3;
- (id)addContainerChildOfType:(unsigned __int16)a3;
- (id)addEshChild:(EshObject *)a3;
- (id)addPptContainerChildOfType:(unsigned __int16)a3;
- (id)addPptEshClientChildOfType:(unsigned __int16)a3;
- (id)childAt:(unint64_t)a3;
- (id)childOfType:(unsigned __int16)a3 instance:(signed __int16)a4;
- (id)containerChildAt:(unint64_t)a3;
- (id)containerChildOfType:(unsigned __int16)a3 instance:(signed __int16)a4 mustExist:(BOOL)a5;
- (id)containerFromObject:(id)a3 mustExist:(BOOL)a4;
- (id)firstChildOfType:(unsigned __int16)a3;
- (id)firstChildOfType:(unsigned __int16)a3 afterChild:(id)a4;
- (id)firstChildOfType:(unsigned __int16)a3 afterIndex:(unint64_t)a4;
- (id)firstContainerChildOfType:(unsigned __int16)a3 mustExist:(BOOL)a4;
- (id)initForExcelBinaryWithType:(unsigned __int16)a3 version:(unsigned __int16)a4 state:(id)a5;
- (id)initFromReader:(OcReader *)a3 type:(unsigned __int16)a4 version:(unsigned __int16)a5;
- (id)initPBWithType:(unsigned __int16)a3 version:(unsigned __int16)a4 state:(id)a5;
- (id)insertEshChild:(EshObject *)a3 at:(unint64_t)a4;
- (id)shapeContainer;
- (unint64_t)childCount;
- (unint64_t)indexOfFirstChildOfType:(unsigned __int16)a3 afterIndex:(unint64_t)a4;
- (void)addCStringWithChar2String:(const unsigned __int16 *)a3 instance:(int)a4;
- (void)addCStringWithNSString:(id)a3 instance:(int)a4;
- (void)addChild:(id)a3;
- (void)eshContainer;
- (void)eshGroup;
- (void)insertChild:(id)a3 at:(unint64_t)a4;
- (void)removeChild:(id)a3;
- (void)writeToWriter:(OcWriter *)a3;
@end

@implementation ESDContainer

+ (void)pbReadChildrenOfObject:(EshObject *)a3 toArray:(id)a4 state:(id)a5
{
  id v19 = a4;
  id v8 = a5;
  uint64_t v9 = [v8 reader];
  int v10 = (*((uint64_t (**)(EshObject *))a3->var0 + 5))(a3);
  if (v10)
  {
    uint64_t v11 = 0;
    do
    {
      uint64_t v12 = (*((uint64_t (**)(EshObject *, uint64_t))a3->var0 + 6))(a3, v11);
      uint64_t v13 = (*((uint64_t (**)(EshObject *, uint64_t))a3->var0 + 7))(a3, v11);
      if (v14) {
        (*(void (**)(uint64_t, void *, uint64_t))(*(void *)v9 + 56))(v9, v14, v11);
      }
      if (v12 == 1)
      {
        v15 = (PptObjectFactory *)(*(uint64_t (**)(uint64_t))(*(void *)v9 + 216))(v9);
        Object = PptObjectFactory::createObject(v15, (PptObjectFactory *)1, v13);
        if (Object) {
        else
        }
          v17 = 0;
        (*(void (**)(uint64_t, void *))(*(void *)v9 + 72))(v9, v17);
        [a1 pbReadChildrenOfObject:v17 toArray:v19 state:v8];
        if (v17) {
          (*(void (**)(void *))(*(void *)v17 + 8))(v17);
        }
      }
      else
      {
        v18 = (void *)[objc_alloc((Class)objc_opt_class()) initPBWithType:v12 version:v13 state:v8];
        if (v18) {
          [v19 addObject:v18];
        }
      }
      uint64_t v11 = (v11 + 1);
    }
    while (v10 != v11);
  }
}

- (ESDContainer)initWithEshObject:(EshObject *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ESDContainer;
  v3 = [(ESDObject *)&v7 initWithEshObject:a3];
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mChildren = v3->mChildren;
    v3->mChildren = v4;
  }
  return v3;
}

- (id)firstChildOfType:(unsigned __int16)a3
{
  int v3 = a3;
  v4 = [(NSMutableArray *)self->mChildren objectEnumerator];
  v5 = 0;
  do
  {
    v6 = [v4 nextObject];

    if (!v6) {
      break;
    }
    uint64_t v7 = [v6 eshObject];
    v5 = v6;
  }
  while ((*(unsigned int (**)(uint64_t))(*(void *)v7 + 16))(v7) != v3);

  return v6;
}

- (unint64_t)childCount
{
  return [(NSMutableArray *)self->mChildren count];
}

- (id)childAt:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mChildren objectAtIndex:a3];
}

- (id)childOfType:(unsigned __int16)a3 instance:(signed __int16)a4
{
  int v4 = a4;
  int v5 = a3;
  v6 = [(NSMutableArray *)self->mChildren objectEnumerator];
  uint64_t v7 = 0;
  while (1)
  {
    id v8 = [v6 nextObject];

    if (!v8) {
      break;
    }
    uint64_t v9 = (const void *)[v8 eshObject];
    uint64_t v7 = v8;
    if ((*(unsigned int (**)(const void *))(*(void *)v9 + 16))(v9) == v5)
    {
      if ((unsigned __int16)(v5 - 2) < 0x1Bu) {
        break;
      }
      uint64_t v7 = v8;
      if (EshRecord::getInstance(v10) == v4) {
        break;
      }
    }
  }

  return v8;
}

- (unint64_t)indexOfFirstChildOfType:(unsigned __int16)a3 afterIndex:(unint64_t)a4
{
  int v5 = a3;
  unint64_t v7 = [(ESDContainer *)self childCount];
  while (++a4 < v7)
  {
    id v8 = [(ESDContainer *)self childAt:a4];
    uint64_t v9 = [v8 eshObject];
    int v10 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 16))(v9);

    if (v10 == v5) {
      return a4;
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)addChild:(id)a3
{
  int v4 = (id *)a3;
  -[NSMutableArray addObject:](self->mChildren, "addObject:");
  objc_storeWeak(v4 + 2, self);
  EshContainer::addChild((EshContainer *)-[ESDContainer eshContainer](self, "eshContainer"), (EshObject *)[v4 eshObject]);
}

- (void)eshContainer
{
  result = self->super.mEshObject;
  if (result) {
  return result;
  }
}

+ (void)readChildrenOfObject:(EshObject *)a3 reader:(OcReader *)a4 toArray:(id)a5
{
  id v12 = a5;
  int v7 = (*((uint64_t (**)(EshObject *))a3->var0 + 5))(a3);
  if (v7)
  {
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = (*((uint64_t (**)(EshObject *, uint64_t))a3->var0 + 6))(a3, v8);
      uint64_t v10 = (*((uint64_t (**)(EshObject *, uint64_t))a3->var0 + 7))(a3, v8);
      uint64_t v11 = (void *)[objc_alloc((Class)objc_opt_class()) initFromReader:a4 type:v9 version:v10];
      if (v11) {
        [v12 addObject:v11];
      }

      uint64_t v8 = (v8 + 1);
    }
    while (v7 != v8);
  }
}

- (void)eshGroup
{
  if (![(ESDContainer *)self childCount]) {
    goto LABEL_6;
  }
  int v3 = [(ESDContainer *)self childAt:0];
  int v4 = (const void *)[v3 eshObject];
  if (!v4)
  {

LABEL_6:
    v7.receiver = self;
    v7.super_class = (Class)ESDContainer;
    return [(ESDObject *)&v7 eshGroup];
  }

  if (!v5) {
    goto LABEL_6;
  }
  return v5;
}

- (id)shapeContainer
{
  return [(ESDContainer *)self childAt:1];
}

- (id)initFromReader:(OcReader *)a3 type:(unsigned __int16)a4 version:(unsigned __int16)a5
{
  v12.receiver = self;
  v12.super_class = (Class)ESDContainer;
  id v6 = [(ESDObject *)&v12 initFromReader:a3 type:a4 version:a5];
  if (v6)
  {
    [(id)objc_opt_class() readChildrenOfObject:*((void *)v6 + 1) reader:a3 toArray:*((void *)v6 + 4)];
    objc_super v7 = [*((id *)v6 + 4) objectEnumerator];
    while (1)
    {
      uint64_t v8 = [v7 nextObject];
      uint64_t v9 = (void *)v8;
      if (!v8) {
        break;
      }
      objc_storeWeak((id *)(v8 + 16), v6);
    }
  }
  id v10 = v6;

  return v10;
}

- (id)addEshChild:(EshObject *)a3
{
  (*((uint64_t (**)(EshObject *, SEL))a3->var0 + 11))(a3, a2);
  int v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEshObject:a3];
  [(ESDContainer *)self addChild:v5];
  return v5;
}

- (id)addChildOfType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  int v5 = +[ESDObjectFactory threadLocalFactory];
  uint64_t v6 = [v5 createObjectWithType:v3];

  return [(ESDContainer *)self addEshChild:v6];
}

- (id)addContainerChildOfType:(unsigned __int16)a3
{
  int v5 = (EshContainer *)operator new(0x38uLL);
  EshContainer::EshContainer(v5, a3);
  return [(ESDContainer *)self addEshChild:v5];
}

- (EshObject)addAtomChildOfType:(unsigned __int16)a3
{
  uint64_t v3 = [(ESDContainer *)self addChildOfType:a3];
  int v4 = (EshObject *)[v3 eshObject];

  return v4;
}

- (void)insertChild:(id)a3 at:(unint64_t)a4
{
  unsigned int v4 = a4;
  uint64_t v6 = (id *)a3;
  -[NSMutableArray insertObject:atIndex:](self->mChildren, "insertObject:atIndex:");
  objc_storeWeak(v6 + 2, self);
  EshContainer::insertChild((EshContainer *)-[ESDContainer eshContainer](self, "eshContainer"), (EshObject *)[v6 eshObject], v4);
}

- (id)insertEshChild:(EshObject *)a3 at:(unint64_t)a4
{
  (*((uint64_t (**)(EshObject *, SEL))a3->var0 + 11))(a3, a2);
  objc_super v7 = (id *)[objc_alloc((Class)objc_opt_class()) initWithEshObject:a3];
  [(NSMutableArray *)self->mChildren insertObject:v7 atIndex:a4];
  objc_storeWeak(v7 + 2, self);
  EshContainer::insertChild((EshContainer *)-[ESDContainer eshContainer](self, "eshContainer"), (EshObject *)[v7 eshObject], a4);
  return v7;
}

- (void)removeChild:(id)a3
{
  int v5 = (id *)a3;
  uint64_t v4 = -[NSMutableArray indexOfObject:](self->mChildren, "indexOfObject:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->mChildren removeObjectAtIndex:v4];
    objc_storeWeak(v5 + 2, 0);
    EshContainer::removeChild((EshContainer *)[(ESDContainer *)self eshContainer], v4);
  }
}

- (id)firstChildOfType:(unsigned __int16)a3 afterChild:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  objc_super v7 = [(NSMutableArray *)self->mChildren objectEnumerator];
  BOOL v8 = 0;
  uint64_t v9 = 0;
  while (1)
  {
    id v10 = [v7 nextObject];

    if (!v10) {
      break;
    }
    if (v8)
    {
      uint64_t v11 = [v10 eshObject];
      BOOL v8 = 1;
      uint64_t v9 = v10;
      if ((*(unsigned int (**)(uint64_t))(*(void *)v11 + 16))(v11) == v4) {
        break;
      }
    }
    else
    {
      BOOL v8 = v10 == v6;
      uint64_t v9 = v10;
    }
  }

  return v10;
}

- (id)firstChildOfType:(unsigned __int16)a3 afterIndex:(unint64_t)a4
{
  unint64_t v5 = [(ESDContainer *)self indexOfFirstChildOfType:a3 afterIndex:a4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [(ESDContainer *)self childAt:v5];
  }
  return v6;
}

- (id)containerFromObject:(id)a3 mustExist:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      TCVerifyInputMeetsCondition(0);
    }
    id v6 = v5;
  }
  else if (v4)
  {
    TCVerifyInputMeetsCondition(0);
  }

  return v5;
}

- (id)firstContainerChildOfType:(unsigned __int16)a3 mustExist:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(ESDContainer *)self firstChildOfType:a3];
  objc_super v7 = [(ESDContainer *)self containerFromObject:v6 mustExist:v4];

  return v7;
}

- (id)containerChildOfType:(unsigned __int16)a3 instance:(signed __int16)a4 mustExist:(BOOL)a5
{
  BOOL v5 = a5;
  objc_super v7 = [(ESDContainer *)self childOfType:a3 instance:a4];
  BOOL v8 = [(ESDContainer *)self containerFromObject:v7 mustExist:v5];

  return v8;
}

- (id)containerChildAt:(unint64_t)a3
{
  BOOL v4 = [(ESDContainer *)self childAt:a3];
  BOOL v5 = [(ESDContainer *)self containerFromObject:v4 mustExist:1];

  return v5;
}

- (void)writeToWriter:(OcWriter *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ESDContainer;
  -[ESDObject writeToWriter:](&v8, sel_writeToWriter_);
  BOOL v5 = [(NSMutableArray *)self->mChildren objectEnumerator];
  while (1)
  {
    id v6 = [v5 nextObject];
    objc_super v7 = v6;
    if (!v6) {
      break;
    }
    [v6 writeToWriter:a3];
  }
}

- (void).cxx_destruct
{
}

- (id)initForExcelBinaryWithType:(unsigned __int16)a3 version:(unsigned __int16)a4 state:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v6 = a3;
  id v8 = a5;
  uint64_t v9 = (void *)[v8 xlReader];
  if (v9) {
    id v10 = (char *)v9 + *(void *)(*v9 - 24);
  }
  else {
    id v10 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)ESDContainer;
  uint64_t v11 = [(ESDObject *)&v15 initFromReader:v10 type:v6 version:v5];
  objc_super v12 = v11;
  if (v11) {
    +[EBEscher readChildrenOfObject:v11[1] toArray:v11[4] state:v8];
  }
  id v13 = v12;

  return v13;
}

- (id)initPBWithType:(unsigned __int16)a3 version:(unsigned __int16)a4 state:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v6 = a3;
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ESDContainer;
  id v9 = [(ESDObject *)&v15 initPBWithType:v6 version:v5 state:v8];
  if (v9)
  {
    [(id)objc_opt_class() pbReadChildrenOfObject:*((void *)v9 + 1) toArray:*((void *)v9 + 4) state:v8];
    id v10 = [*((id *)v9 + 4) objectEnumerator];
    while (1)
    {
      uint64_t v11 = [v10 nextObject];
      objc_super v12 = (void *)v11;
      if (!v11) {
        break;
      }
      objc_storeWeak((id *)(v11 + 16), v9);
    }
  }
  id v13 = v9;

  return v13;
}

- (id)addPptContainerChildOfType:(unsigned __int16)a3
{
  uint64_t v5 = (EshContainer *)operator new(0x48uLL);
  EshContainer::EshContainer(v5, a3);
  *(void *)uint64_t v5 = &unk_26EBE7950;
  *((void *)v5 + 7) = &unk_26EBE7A00;
  *((unsigned char *)v5 + 64) = 0;
  *((_DWORD *)v5 + 17) = -1;
  return [(ESDContainer *)self addEshChild:v5];
}

- (EshObject)addPptAtomChildOfType:(unsigned __int16)a3
{
  PowerPointObject = (EshObject *)PptObjectFactory::createPowerPointObject((PptObjectFactory *)a3, 0);
  id v5 = [(ESDContainer *)self addEshChild:PowerPointObject];
  return PowerPointObject;
}

- (id)addPptEshClientChildOfType:(unsigned __int16)a3
{
  int v3 = a3;
  int v5 = (*((uint64_t (**)(EshObject *, SEL))self->super.mEshObject->var0 + 2))(self->super.mEshObject, a2);
  mEshObject = (char *)self->super.mEshObject;
  if (v5 == 7)
  {
    if (mEshObject) {
    objc_super v7 = (PptEshClientContainer *)(mEshObject + 576);
    }
  }
  else
  {
    int v8 = (*(uint64_t (**)(char *))(*(void *)mEshObject + 16))(mEshObject);
    mEshObject = (char *)self->super.mEshObject;
    if (v8 == 6)
    {
      if (mEshObject) {
      objc_super v7 = (PptEshClientContainer *)(mEshObject + 368);
      }
    }
    else
    {
      if ((*(unsigned int (**)(char *))(*(void *)mEshObject + 16))(mEshObject) != 12)
      {
        id v9 = 0;
        goto LABEL_16;
      }
      mEshObject = (char *)self->super.mEshObject;
      if (mEshObject) {
      objc_super v7 = (PptEshClientContainer *)(mEshObject + 328);
      }
    }
  }
  if (mEshObject) {
    id v9 = v7;
  }
  else {
    id v9 = 0;
  }
LABEL_16:
  switch(v3)
  {
    case 61453:
      id v10 = (char *)operator new(0x38uLL);
      PptEshClientTextBox::PptEshClientTextBox((PptEshClientTextBox *)v10);
      break;
    case 61457:
      id v10 = (char *)operator new(0x38uLL);
      PptEshClientData::PptEshClientData((PptEshClientData *)v10);
      break;
    case 61456:
      id v10 = (char *)operator new(0x30uLL);
      PptEshClientAnchor::PptEshClientAnchor((PptEshClientAnchor *)v10);
      break;
    default:
      uint64_t v11 = 0;
      goto LABEL_26;
  }
  uint64_t v11 = 0;
  if (v10 && v9)
  {
    PptEshClientContainer::addChild(v9, (const EshHeader *)(v10 + 12));
    (*(uint64_t (**)(char *))(*(void *)v10 + 80))(v10);
    id v12 = objc_alloc((Class)objc_opt_class());
    uint64_t v11 = (void *)[v12 initWithEshObject:v10];

    [(NSMutableArray *)self->mChildren addObject:v11];
  }
LABEL_26:
  return v11;
}

- (void)addCStringWithNSString:(id)a3 instance:(int)a4
{
  __int16 v4 = a4;
  id v8 = a3;
  uint64_t v6 = (PptCString *)operator new(0x48uLL);
  PptCString::PptCString(v6);
  EshRecord::setInstance((uint64_t)v6, v4);
  id v7 = [(ESDContainer *)self addEshChild:v6];
  [v8 copyToCsString:(char *)v6 + 48];
}

- (void)addCStringWithChar2String:(const unsigned __int16 *)a3 instance:(int)a4
{
  __int16 v4 = a4;
  id v7 = (CsString *)operator new(0x48uLL);
  PptCString::PptCString((PptCString *)v7);
  EshRecord::setInstance((uint64_t)v7, v4);
  id v8 = [(ESDContainer *)self addEshChild:v7];
  CsString::append(v7 + 2, a3);
}

@end