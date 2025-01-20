@interface VKRouteEtaDescription
- (BOOL)isEqual:(id)a3;
- (GEOFeatureStyleAttributes)styleAttributes;
- (NSString)etaText;
- (VKRouteEtaDescription)initWithEtaText:(id)a3;
- (VKRouteEtaDescription)initWithEtaText:(id)a3 etaAdvisoryFeatureStyleAttributes:(id)a4;
- (VKRouteEtaDescription)initWithEtaText:(id)a3 etaAdvisoryStyleAttributes:(id)a4;
- (VKRouteEtaDescription)initWithEtaText:(id)a3 etaAdvisoryStyleAttributes:(id)a4 routeEtaType:(int64_t)a5;
- (VKRouteEtaDescription)initWithEtaText:(id)a3 glyphType:(unsigned __int8)a4;
- (id).cxx_construct;
- (id)_initWithEtaText:(id)a3 styleAttributes:(id)a4 routeEtaType:(int64_t)a5;
- (int64_t)compare:(id)a3;
- (int64_t)routeEtaType;
- (unint64_t)hash;
- (unsigned)glyphType;
@end

@implementation VKRouteEtaDescription

- (id).cxx_construct
{
  *((void *)self + 1) = &unk_1EF559F18;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  self->_etaText._vptr$_retain_ptr = (void **)&unk_1EF559F18;
  obj = self->_etaText._obj;
}

- (int64_t)routeEtaType
{
  return self->_routeEtaType;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (unsigned)glyphType
{
  return self->_glyphType;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  if ([v4 routeEtaType] != self->_routeEtaType)
  {
    if ([v4 routeEtaType] < self->_routeEtaType) {
      int64_t v6 = -1;
    }
    else {
      int64_t v6 = 1;
    }
    goto LABEL_40;
  }
  if ([v4 glyphType] != self->_glyphType)
  {
    if ([v4 glyphType] < self->_glyphType) {
      int64_t v6 = -1;
    }
    else {
      int64_t v6 = 1;
    }
    goto LABEL_40;
  }
  if (!self->_styleAttributes)
  {
    styleAttributes = 0;
    goto LABEL_14;
  }
  v5 = [v4 styleAttributes];
  if (!v5)
  {
    styleAttributes = self->_styleAttributes;
LABEL_14:
    v8 = [v4 styleAttributes];

    if (styleAttributes != v8)
    {
      if (self->_styleAttributes) {
        int64_t v6 = 1;
      }
      else {
        int64_t v6 = -1;
      }
      goto LABEL_40;
    }
    goto LABEL_18;
  }

LABEL_18:
  if (!self->_styleAttributes) {
    goto LABEL_39;
  }
  v9 = [v4 styleAttributes];

  if (!v9) {
    goto LABEL_39;
  }
  v10 = self->_styleAttributes;
  if (v10)
  {
    [(GEOFeatureStyleAttributes *)v10 featureStyleAttributesPtr];
    long long v11 = v23;
  }
  else
  {
    long long v11 = 0uLL;
  }
  long long v24 = v11;
  long long v23 = 0uLL;
  v12 = [v4 styleAttributes];
  v13 = v12;
  if (v12)
  {
    [v12 featureStyleAttributesPtr];
    long long v14 = v21;
  }
  else
  {
    long long v14 = 0uLL;
  }
  long long v22 = v14;
  int v15 = geo::codec::featureStyleAttributesCompare((uint64_t *)&v24, (uint64_t *)&v22);
  v16 = (std::__shared_weak_count *)*((void *)&v22 + 1);
  if (*((void *)&v22 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v22 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }

  v17 = (std::__shared_weak_count *)*((void *)&v24 + 1);
  if (*((void *)&v24 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v24 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
  }
  v18 = (std::__shared_weak_count *)*((void *)&v23 + 1);
  if (*((void *)&v23 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v23 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
  }
  int64_t v6 = v15 > 0 ? -1 : 1;
  if (!v15)
  {
LABEL_39:
    v19 = [v4 etaText];
    int64_t v6 = [v19 compare:self->_etaText._obj];
  }
LABEL_40:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_etaText._obj hash];
  unint64_t v4 = ((v3 << 6) + (v3 >> 2) + self->_glyphType - 0x61C8864680B583EBLL) ^ v3;
  styleAttributes = self->_styleAttributes;
  if (styleAttributes)
  {
    [(GEOFeatureStyleAttributes *)styleAttributes featureStyleAttributes];
    v4 ^= (v4 << 6) - 0x61C8864680B583EBLL + (v4 >> 2) + featureStyleAttributesHash();
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (VKRouteEtaDescription *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 == objc_opt_class() && [(VKRouteEtaDescription *)self compare:v4] == 0;
  }

  return v6;
}

- (NSString)etaText
{
  return self->_etaText._obj;
}

- (id)_initWithEtaText:(id)a3 styleAttributes:(id)a4 routeEtaType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)VKRouteEtaDescription;
  v10 = [(VKRouteEtaDescription *)&v17 init];
  if (v10)
  {
    long long v11 = (NSString *)v8;
    v12 = v11;
    if (v11) {
      v13 = v11;
    }
    obj = v10->_etaText._obj;
    v10->_etaText._obj = v12;

    objc_storeStrong((id *)&v10->_styleAttributes, a4);
    v10->_routeEtaType = a5;
    int v15 = v10;
  }

  return v10;
}

- (VKRouteEtaDescription)initWithEtaText:(id)a3 etaAdvisoryStyleAttributes:(id)a4 routeEtaType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F645A0]) initWithGEOStyleAttributes:v9];
  long long v11 = [(VKRouteEtaDescription *)self _initWithEtaText:v8 styleAttributes:v10 routeEtaType:a5];

  return v11;
}

- (VKRouteEtaDescription)initWithEtaText:(id)a3 etaAdvisoryFeatureStyleAttributes:(id)a4
{
  return (VKRouteEtaDescription *)[(VKRouteEtaDescription *)self _initWithEtaText:a3 styleAttributes:a4 routeEtaType:0];
}

- (VKRouteEtaDescription)initWithEtaText:(id)a3 etaAdvisoryStyleAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F645A0]) initWithGEOStyleAttributes:v7];
  id v9 = [(VKRouteEtaDescription *)self _initWithEtaText:v6 styleAttributes:v8 routeEtaType:0];

  return v9;
}

- (VKRouteEtaDescription)initWithEtaText:(id)a3
{
  return (VKRouteEtaDescription *)[(VKRouteEtaDescription *)self _initWithEtaText:a3 styleAttributes:0 routeEtaType:0];
}

- (VKRouteEtaDescription)initWithEtaText:(id)a3 glyphType:(unsigned __int8)a4
{
  int v4 = a4;
  id v6 = a3;
  id v7 = [(VKRouteEtaDescription *)self initWithEtaText:v6];
  v7->_glyphType = v4;
  if (v4 == 1) {
    id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F645A0]), "initWithAttributes:", 65618, 3, 0);
  }
  else {
    id v8 = 0;
  }
  id v9 = [(VKRouteEtaDescription *)v7 _initWithEtaText:v6 styleAttributes:v8 routeEtaType:0];

  return v9;
}

@end