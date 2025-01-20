@interface TUILayoutOptionsLayout
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth;
- (BOOL)validatesAllChildren;
- (TUILayout)chosenChild;
- (id)axModelTreeWithCustomActionsCollector:(id)a3 scrollAncestorLayout:(id)a4 scrollAncestorTranslation:(CGPoint)a5 liveTransformAncestorLayout:(id)a6;
- (id)computedBoundsChildrenWithFlags:(unint64_t)a3;
- (unint64_t)chosenIndex;
- (void)appendChildRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 toModels:(id)a6;
- (void)computeLayout;
- (void)onChildInvalidate:(id)a3;
- (void)onChildInvalidateIntrinsicSize:(id)a3;
- (void)onChildrenUpdated;
- (void)onInvalidate;
- (void)setChosenChild:(id)a3;
- (void)setChosenIndex:(unint64_t)a3;
@end

@implementation TUILayoutOptionsLayout

- (void)onChildrenUpdated
{
  v4.receiver = self;
  v4.super_class = (Class)TUILayoutOptionsLayout;
  [(TUILayout *)&v4 onChildrenUpdated];
  chosenChild = self->_chosenChild;
  self->_chosenChild = 0;
}

- (BOOL)validatesAllChildren
{
  return 0;
}

- (void)onChildInvalidate:(id)a3
{
  chosenChild = (TUILayout *)a3;
  v8 = chosenChild;
  if (self->_chosenChild != chosenChild)
  {
    v5 = [(TUILayout *)self children];
    id v6 = [v5 indexOfObjectIdenticalTo:v8];
    unint64_t chosenIndex = self->_chosenIndex;

    if ((unint64_t)v6 >= chosenIndex) {
      goto LABEL_5;
    }
    chosenChild = self->_chosenChild;
  }
  self->_chosenChild = 0;

LABEL_5:
}

- (void)onInvalidate
{
  v4.receiver = self;
  v4.super_class = (Class)TUILayoutOptionsLayout;
  [(TUILayout *)&v4 onInvalidate];
  chosenChild = self->_chosenChild;
  self->_chosenChild = 0;

  self->_unint64_t chosenIndex = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)onChildInvalidateIntrinsicSize:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TUILayoutOptionsLayout;
  [(TUILayout *)&v5 onChildInvalidateIntrinsicSize:a3];
  chosenChild = self->_chosenChild;
  self->_chosenChild = 0;

  self->_unint64_t chosenIndex = 0x7FFFFFFFFFFFFFFFLL;
}

- (id)computedBoundsChildrenWithFlags:(unint64_t)a3
{
  if (self->_chosenChild)
  {
    chosenChild = self->_chosenChild;
    v3 = +[NSArray arrayWithObjects:&chosenChild count:1];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  v3 = [(TUILayout *)self children];
  objc_super v4 = [v3 firstObject];

  objc_super v5 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)[v4 validatedIntrinsicWidthConsideringSpecified];
  return v5;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  v3 = [(TUILayout *)self children];
  objc_super v4 = [v3 firstObject];

  objc_super v5 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)[v4 validatedIntrinsicHeightConsideringSpecified];
  return v5;
}

- (void)computeLayout
{
  chosenChild = self->_chosenChild;
  if (!chosenChild)
  {
    objc_super v4 = [(TUILayout *)self children];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_7E7AC;
    v7[3] = &unk_253F80;
    v7[4] = self;
    [v4 enumerateObjectsUsingBlock:v7];
    if (!self->_chosenChild && [v4 count])
    {
      objc_super v5 = [v4 lastObject];
      id v6 = self->_chosenChild;
      self->_chosenChild = v5;

      self->_unint64_t chosenIndex = (unint64_t)[v4 count] - 1;
    }

    chosenChild = self->_chosenChild;
  }
  -[TUILayout setComputedOrigin:](chosenChild, "setComputedOrigin:", CGPointZero.x, CGPointZero.y);
  [(TUILayout *)self->_chosenChild computedTransformedSize];
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:");
}

- (void)appendChildRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 toModels:(id)a6
{
  if (self->_chosenChild)
  {
    chosenChild = self->_chosenChild;
    id v10 = a6;
    id v11 = a4;
    v12 = +[NSArray arrayWithObjects:&chosenChild count:1];
    long long v13 = *(_OWORD *)&a5->c;
    v14[0] = *(_OWORD *)&a5->a;
    v14[1] = v13;
    v14[2] = *(_OWORD *)&a5->tx;
    [(TUILayout *)self appendChilden:v12 renderModelCompatibleWithKind:a3 context:v11 transform:v14 toModels:v10];
  }
}

- (id)axModelTreeWithCustomActionsCollector:(id)a3 scrollAncestorLayout:(id)a4 scrollAncestorTranslation:(CGPoint)a5 liveTransformAncestorLayout:(id)a6
{
  return -[TUILayout axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:](self->_chosenChild, "axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:", a3, a4, a6, a5.x, a5.y);
}

- (unint64_t)chosenIndex
{
  return self->_chosenIndex;
}

- (void)setChosenIndex:(unint64_t)a3
{
  self->_unint64_t chosenIndex = a3;
}

- (TUILayout)chosenChild
{
  return self->_chosenChild;
}

- (void)setChosenChild:(id)a3
{
}

- (void).cxx_destruct
{
}

@end