@interface BKTouchDestination
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)appendSuccinctDescriptionToFormatter:(id)a3;
@end

@implementation BKTouchDestination

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_touchStream);

  objc_storeStrong((id *)&self->_externalReferences, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKTouchDestination;
  id v4 = [(BKCAContextDestination *)&v7 copyWithZone:a3];
  *((void *)v4 + 4) = self->_predicate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchStream);
  objc_storeWeak((id *)v4 + 5, WeakRetained);

  return v4;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100097160;
  v3[3] = &unk_1000F8E50;
  v3[4] = self;
  v3[5] = a3;
  [a3 appendProem:self block:v3];
}

- (void)appendSuccinctDescriptionToFormatter:(id)a3
{
  unint64_t predicate = self->_predicate;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  objc_super v7 = v6;
  if ((predicate & 1) == 0)
  {
    if ((predicate & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    [v7 addObject:@"touchStream"];
    if ((predicate & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  [v6 addObject:@"hitTest"];
  if ((predicate & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((predicate & 4) != 0) {
LABEL_4:
  }
    [v7 addObject:@"filterDetachedTouches"];
LABEL_5:
  v8 = [v7 componentsJoinedByString:@"|"];
  v9 = +[NSString stringWithFormat:@"(%@)", v8];

  [a3 appendString:v9 withName:0];
  v10.receiver = self;
  v10.super_class = (Class)BKTouchDestination;
  [(BKCAContextDestination *)&v10 appendSuccinctDescriptionToFormatter:a3];
}

- (id)description
{
  return +[BSDescriptionStream descriptionForRootObject:self];
}

@end