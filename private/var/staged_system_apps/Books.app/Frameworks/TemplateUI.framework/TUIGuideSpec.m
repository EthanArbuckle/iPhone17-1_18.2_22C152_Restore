@interface TUIGuideSpec
+ (id)columnWithIndex:(int64_t)a3 edge:(unint64_t)a4;
+ (id)contentWithEdge:(unint64_t)a3;
+ (id)gridWithEdge:(unint64_t)a3;
+ (id)named:(int64_t)a3;
+ (id)unbound;
- (BOOL)isEqual:(id)a3;
- (TUIGuideSpec)initWithOther:(id)a3;
- (id)_initWithKind:(unint64_t)a3 index:(int64_t)a4 edge:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)index;
- (unint64_t)edge;
- (unint64_t)hash;
- (unint64_t)kind;
@end

@implementation TUIGuideSpec

- (id)_initWithKind:(unint64_t)a3 index:(int64_t)a4 edge:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)TUIGuideSpec;
  id result = [(TUIGuideSpec *)&v9 init];
  if (result)
  {
    *((void *)result + 1) = a3;
    *((void *)result + 2) = a4;
    *((void *)result + 3) = a5;
  }
  return result;
}

- (TUIGuideSpec)initWithOther:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TUIGuideSpec;
  v5 = [(TUIGuideSpec *)&v7 init];
  if (v5)
  {
    v5->_kind = (unint64_t)[v4 kind];
    v5->_index = (int64_t)[v4 index];
    v5->_edge = (unint64_t)[v4 edge];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());

  return [v4 initWithOther:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v8 = (objc_opt_isKindOfClass() & 1) != 0
    && (id kind = self->_kind, kind == [v4 kind])
    && (id edge = self->_edge, edge == [v4 edge])
    && (id index = self->_index, index == [v4 index])
    && self->_kind != 1;

  return v8;
}

- (unint64_t)hash
{
  return (16 * self->_edge) | (self->_index << 8) | self->_kind;
}

+ (id)gridWithEdge:(unint64_t)a3
{
  id v3 = [objc_alloc((Class)a1) _initWithKind:2 index:0x7FFFFFFFFFFFFFFFLL edge:a3];

  return v3;
}

+ (id)contentWithEdge:(unint64_t)a3
{
  id v3 = [objc_alloc((Class)a1) _initWithKind:3 index:0x7FFFFFFFFFFFFFFFLL edge:a3];

  return v3;
}

+ (id)columnWithIndex:(int64_t)a3 edge:(unint64_t)a4
{
  id v4 = [objc_alloc((Class)a1) _initWithKind:4 index:a3 edge:a4];

  return v4;
}

+ (id)unbound
{
  id v2 = [objc_alloc((Class)a1) _initWithKind:1 index:0x7FFFFFFFFFFFFFFFLL edge:0];

  return v2;
}

+ (id)named:(int64_t)a3
{
  id v3 = [objc_alloc((Class)a1) _initWithKind:5 index:a3 edge:0];

  return v3;
}

- (id)description
{
  unint64_t edge = self->_edge;
  if (edge > 3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = (uint64_t)*(&off_255010 + edge);
  }
  switch(self->_kind)
  {
    case 0uLL:
      v5 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v5);
      +[NSString stringWithFormat:@"<%@ unknown>", v6, v14, v15];
      goto LABEL_12;
    case 1uLL:
      BOOL v8 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v8);
      +[NSString stringWithFormat:@"<%@ unbound>", v6, v14, v15];
      goto LABEL_12;
    case 2uLL:
      objc_super v9 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v9);
      +[NSString stringWithFormat:@"<%@ grid %@>", v6, v4, v15];
      goto LABEL_12;
    case 3uLL:
      v10 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v10);
      +[NSString stringWithFormat:@"<%@ content %@>", v6, v4, v15];
      goto LABEL_12;
    case 4uLL:
      v11 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v11);
      +[NSString stringWithFormat:@"<%@ column=%ld %@>", v6, self->_index, v4];
      goto LABEL_12;
    case 5uLL:
      v12 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v12);
      +[NSString stringWithFormat:@"<%@ named %ld>", v6, self->_index, v15];
      objc_super v7 = LABEL_12:;

      break;
    default:
      objc_super v7 = 0;
      break;
  }

  return v7;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (int64_t)index
{
  return self->_index;
}

- (unint64_t)edge
{
  return self->_edge;
}

@end