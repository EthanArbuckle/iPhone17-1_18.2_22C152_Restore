@interface VKLabelMarker
+ (VKLabelMarker)markerWithLabelMarker:(const void *)a3;
- ($1AB5FA073B851C12C2339EC22442E995)coordinate3D;
- (BOOL)hasBuildingFaceAzimuth;
- (BOOL)hasBusinessID;
- (BOOL)hasFacingDirection;
- (BOOL)hasVenueLookInsideFloorOrdinal;
- (BOOL)isARWalkingFeature;
- (BOOL)isAlongSelectedTransitLine;
- (BOOL)isCluster;
- (BOOL)isClusterChild;
- (BOOL)isDragged;
- (BOOL)isFlyoverTour;
- (BOOL)isLabelHitAtScreenPoint:(CGPoint)a3 selectableLabelsOnly:(BOOL)a4;
- (BOOL)isLeafCluster;
- (BOOL)isOccluded;
- (BOOL)isOnRoute;
- (BOOL)isOneWayArrow;
- (BOOL)isRouteAnnotation;
- (BOOL)isRouteEta;
- (BOOL)isRouteWaypoint;
- (BOOL)isSelectable;
- (BOOL)isSelected;
- (BOOL)isTextVisible;
- (BOOL)isTrafficCamera;
- (BOOL)isTrafficIncident;
- (BOOL)isTrail;
- (BOOL)isTransit;
- (BOOL)isTransitAccessPoint;
- (BOOL)isTransitLine;
- (BOOL)isVenueButton;
- (BOOL)isVisible;
- (BOOL)positionOfInterest:(id *)a3 zoom:(float *)a4;
- (BOOL)useVKSelectionBalloon;
- (Box<double,)_bounds;
- (CGPoint)calloutAnchorPointWithSnapToPixels:(BOOL)a3;
- (CGRect)_calloutAnchorRect:(BOOL)a3;
- (CGRect)calloutAnchorRect;
- (CGRect)lateralCalloutAnchorRect;
- (CGRect)screenBounds;
- (CGRect)screenCollisionBounds;
- (NSArray)dataIconImageKeys;
- (NSArray)iconImageKeys;
- (NSArray)imageKeys;
- (NSArray)relatedSubTexts;
- (NSArray)relatedTexts;
- (NSArray)shields;
- (NSArray)transitSystems;
- (VKLabelMarker)initWithLabelMarkerPtr:(const void *)a3;
- (const)featureIDs;
- (const)labelMarkerImpl;
- (float)buildingFaceAzimuth;
- (float)buildingHeight;
- (float)facingDirection;
- (id).cxx_construct;
- (id)arWalkingFeature;
- (id)clusterContentBounds;
- (id)clusterFeatureAnnotations;
- (id)clusterWaypointInfos;
- (id)debugAnchorPointString;
- (id)featureAnnotation;
- (id)featureHandles;
- (id)incident;
- (id)locale;
- (id)mapRegion;
- (id)parentClusterLabelMarker;
- (id)routeAnnotations;
- (id)routeInfo;
- (id)subtext;
- (id)text;
- (id)trafficCamera;
- (id)waypointInfo;
- (int)featureType;
- (int)selectionType;
- (int)sortKey;
- (signed)venueFloorOrdinal;
- (signed)venueLookInsideFloorOrdinal;
- (unint64_t)animationID;
- (unint64_t)businessID;
- (unint64_t)clientFeatureID;
- (unint64_t)clusterFeatureCount;
- (unint64_t)countFeatureIDs;
- (unint64_t)elementCount;
- (unint64_t)featureLabelIdentifier;
- (unint64_t)venueBuildingID;
- (unint64_t)venueComponentID;
- (unint64_t)venueID;
- (unint64_t)venueLevelID;
- (unsigned)externalFeatureCategory;
- (unsigned)pickedLabelBalloonBehavior;
- (unsigned)venueComponentType;
- (void)setIsDragged:(BOOL)a3;
- (void)setLabelPressed:(BOOL)a3;
- (void)setUseVKSelectionBalloon:(BOOL)a3;
@end

@implementation VKLabelMarker

+ (VKLabelMarker)markerWithLabelMarker:(const void *)a3
{
  if (*(void *)a3)
  {
    id v4 = *(id *)(*(void *)a3 + 24);
    v5 = v4;
    if (v4) {
      v6 = (VKLabelMarker *)v4;
    }
    else {
      v6 = [[VKLabelMarker alloc] initWithLabelMarkerPtr:a3];
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_labelMarker.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (id)parentClusterLabelMarker
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)self->_labelMarker.__ptr_ + 352))(&v5);
  if (v5)
  {
    v2 = +[VKLabelMarker markerWithLabelMarker:&v5];
    v3 = v6;
    if (!v6) {
      goto LABEL_7;
    }
  }
  else
  {
    v2 = 0;
    v3 = v6;
    if (!v6) {
      goto LABEL_7;
    }
  }
  if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
LABEL_7:
  return v2;
}

- (BOOL)isClusterChild
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 344))();
}

- (id)clusterWaypointInfos
{
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  {
    operator new();
  }
  uint64_t v12 = mdm::Allocator::instance(void)::alloc;
  (*(void (**)(LabelMarker *, uint64_t *))(*(void *)self->_labelMarker.__ptr_ + 368))(self->_labelMarker.__ptr_, &v9);
  v3 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
  uint64_t v4 = v9;
  if (v9)
  {
    uint64_t v5 = v10;
    uint64_t v6 = v9;
    if (v10 != v9)
    {
      do
      {
        v7 = *(void **)(v5 - 8);
        v5 -= 8;
      }
      while (v5 != v4);
      uint64_t v6 = v9;
    }
    uint64_t v10 = v4;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v12 + 40))(v12, v6, v11 - v6);
  }
  return v3;
}

- (id)clusterFeatureAnnotations
{
  v14 = 0;
  v15 = 0;
  uint64_t v16 = 0;
  {
    operator new();
  }
  uint64_t v17 = mdm::Allocator::instance(void)::alloc;
  (*(void (**)(LabelMarker *, id **))(*(void *)self->_labelMarker.__ptr_ + 360))(self->_labelMarker.__ptr_, &v14);
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = (void *)[v3 initWithCapacity:v15 - v14];
  uint64_t v5 = v14;
  uint64_t v6 = v15;
  while (v5 != v6)
  {
    id v7 = *v5;
    if (v7) {
      [v4 addObject:v7];
    }

    ++v5;
  }
  v8 = [MEMORY[0x1E4F1C978] arrayWithArray:v4];

  uint64_t v9 = v14;
  if (v14)
  {
    uint64_t v10 = v15;
    uint64_t v11 = v14;
    if (v15 != v14)
    {
      do
      {
        uint64_t v12 = *--v10;
      }
      while (v10 != v9);
      uint64_t v11 = v14;
    }
    v15 = v9;
    (*(void (**)(uint64_t, id *, uint64_t))(*(void *)v17 + 40))(v17, v11, v16 - (void)v11);
  }
  return v8;
}

- (unint64_t)clusterFeatureCount
{
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  {
    v8 = self;
    self = v8;
    if (v9) {
      operator new();
    }
  }
  uint64_t v13 = mdm::Allocator::instance(void)::alloc;
  (*(void (**)(LabelMarker *, uint64_t *))(*(void *)self->_labelMarker.__ptr_ + 360))(self->_labelMarker.__ptr_, &v10);
  uint64_t v3 = v10;
  uint64_t v2 = v11;
  if (v10)
  {
    if (v11 == v10)
    {
      uint64_t v6 = v11;
    }
    else
    {
      uint64_t v4 = v11;
      do
      {
        uint64_t v5 = *(void **)(v4 - 8);
        v4 -= 8;
      }
      while (v4 != v3);
      uint64_t v6 = v10;
    }
    uint64_t v11 = v3;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v13 + 40))(v13, v6, v12 - v6);
  }
  return (v2 - v3) >> 3;
}

- (id)clusterContentBounds
{
  return (id)(*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 336))();
}

- (BOOL)isLeafCluster
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 328))();
}

- (BOOL)isCluster
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 320))();
}

- (id)debugAnchorPointString
{
  [(VKLabelMarker *)self _bounds];
  return (id)[NSString stringWithFormat:@"<LabelMarker> rect:{%f, %f, %f, %f}", v2, v4, v3, v5];
}

- (unint64_t)elementCount
{
  return (*(unsigned int (**)(LabelMarker *, SEL))(*(void *)self->_labelMarker.__ptr_ + 696))(self->_labelMarker.__ptr_, a2);
}

- (int)sortKey
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 232))();
}

- (unint64_t)animationID
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 224))();
}

- (unsigned)externalFeatureCategory
{
  unsigned int v2 = (*(uint64_t (**)(LabelMarker *, SEL))(*(void *)self->_labelMarker.__ptr_ + 672))(self->_labelMarker.__ptr_, a2);
  if (v2 >= 4) {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (unsigned)pickedLabelBalloonBehavior
{
  if ([(VKLabelMarker *)self useVKSelectionBalloon]) {
    return 1;
  }
  int v4 = (*(uint64_t (**)(LabelMarker *))(*(void *)self->_labelMarker.__ptr_ + 648))(self->_labelMarker.__ptr_);
  if (v4 == 2) {
    return 2;
  }
  else {
    return v4 == 1;
  }
}

- (int)selectionType
{
  return (*(uint64_t (**)(LabelMarker *, SEL))(*(void *)self->_labelMarker.__ptr_ + 640))(self->_labelMarker.__ptr_, a2) == 1;
}

- (BOOL)isLabelHitAtScreenPoint:(CGPoint)a3 selectableLabelsOnly:(BOOL)a4
{
  CGPoint v5 = a3;
  return (*(uint64_t (**)(LabelMarker *, CGPoint *, BOOL))(*(void *)self->_labelMarker.__ptr_ + 656))(self->_labelMarker.__ptr_, &v5, a4);
}

- (CGRect)screenBounds
{
  md::LabelMarker::acquireDisplayLock((md::LabelMarker *)&v17, (uint64_t)self->_labelMarker.__ptr_);
  if (!v17)
  {
    float v3 = 0.0;
    if (!v20) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  float v3 = *(float *)(v17 + 1508);
  if (v20) {
LABEL_3:
  }
    std::recursive_mutex::unlock(v19);
LABEL_4:
  int v4 = v18;
  if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  float v5 = (*(float (**)(LabelMarker *))(*(void *)self->_labelMarker.__ptr_ + 576))(self->_labelMarker.__ptr_);
  if (v7 < v5 || v8 < v6)
  {
    double v13 = *MEMORY[0x1E4F1DB28];
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    float v10 = v5;
    float v11 = v6;
    float v12 = 1.0 / *((float *)self->_labelMarker.__ptr_ + 62);
    double v13 = (float)(v5 * v12);
    double v14 = (float)((float)(v3 - v8) * v12);
    double v15 = (float)((float)(v7 - v10) * v12);
    double v16 = (float)((float)(v8 - v11) * v12);
  }
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)screenCollisionBounds
{
  md::LabelMarker::acquireDisplayLock((md::LabelMarker *)&v17, (uint64_t)self->_labelMarker.__ptr_);
  if (!v17)
  {
    float v3 = 0.0;
    if (!v20) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  float v3 = *(float *)(v17 + 1508);
  if (v20) {
LABEL_3:
  }
    std::recursive_mutex::unlock(v19);
LABEL_4:
  int v4 = v18;
  if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  float v5 = (*(float (**)(LabelMarker *))(*(void *)self->_labelMarker.__ptr_ + 568))(self->_labelMarker.__ptr_);
  if (v7 < v5 || v8 < v6)
  {
    double v13 = *MEMORY[0x1E4F1DB28];
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    float v10 = v5;
    float v11 = v6;
    float v12 = 1.0 / *((float *)self->_labelMarker.__ptr_ + 62);
    double v13 = (float)(v5 * v12);
    double v14 = (float)((float)(v3 - v8) * v12);
    double v15 = (float)((float)(v7 - v10) * v12);
    double v16 = (float)((float)(v8 - v11) * v12);
  }
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGPoint)calloutAnchorPointWithSnapToPixels:(BOOL)a3
{
  (*(void (**)(LabelMarker *, BOOL))(*(void *)self->_labelMarker.__ptr_ + 664))(self->_labelMarker.__ptr_, a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setLabelPressed:(BOOL)a3
{
}

- (NSArray)shields
{
  ptr = self->_labelMarker.__ptr_;
  uint64_t v17 = 0;
  v18 = 0;
  uint64_t v3 = *((void *)ptr + 19);
  uint64_t v19 = 0;
  uint64_t v20 = v3;
  std::vector<geo::_retain_ptr<VKImageSourceKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,geo::StdAllocator<geo::_retain_ptr<VKImageSourceKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,mdm::Allocator>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKImageSourceKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKImageSourceKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>((uint64_t)&v17, *((void *)ptr + 16), *((void *)ptr + 17), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)ptr + 17) - *((void *)ptr + 16)) >> 3));
  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  float v5 = v17;
  float v6 = v18;
  float v7 = (void *)[v4 initWithCapacity:0xAAAAAAAAAAAAAAABLL * (v18 - v17)];
  if (v5 != v6)
  {
    float v8 = v5;
    do
    {
      int v9 = [[VKLabelMarkerShield alloc] initWithImageKey:v8[1]];
      if (v9) {
        [v7 addObject:v9];
      }

      v8 += 3;
    }
    while (v8 != v6);
  }
  float v10 = [MEMORY[0x1E4F1C978] arrayWithArray:v7];

  if (v5)
  {
    if (v5 == v6)
    {
      float v5 = v6;
    }
    else
    {
      float v11 = v6 - 3;
      float v12 = v11;
      double v13 = v11;
      do
      {
        double v14 = *v13;
        v13 -= 3;
        (*v14)(v12);
        v11 -= 3;
        BOOL v15 = v12 == v5;
        float v12 = v13;
      }
      while (!v15);
      float v6 = v5;
    }
    (*(void (**)(uint64_t, void (***)(void), uint64_t))(*(void *)v20 + 40))(v20, v5, v19 - (void)v6);
  }
  return (NSArray *)v10;
}

- (NSArray)imageKeys
{
  ptr = self->_labelMarker.__ptr_;
  uint64_t v17 = 0;
  v18 = 0;
  uint64_t v3 = *((void *)ptr + 11);
  uint64_t v19 = 0;
  uint64_t v20 = v3;
  std::vector<geo::_retain_ptr<VKImageSourceKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,geo::StdAllocator<geo::_retain_ptr<VKImageSourceKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,mdm::Allocator>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKImageSourceKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKImageSourceKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>((uint64_t)&v17, *((void *)ptr + 8), *((void *)ptr + 9), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)ptr + 9) - *((void *)ptr + 8)) >> 3));
  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  float v5 = v17;
  float v6 = v18;
  float v7 = (void *)[v4 initWithCapacity:0xAAAAAAAAAAAAAAABLL * (v18 - v17)];
  if (v5 != v6)
  {
    float v8 = v5;
    do
    {
      int v9 = v8[1];
      if (v9) {
        [v7 addObject:v9];
      }

      v8 += 3;
    }
    while (v8 != v6);
  }
  float v10 = [MEMORY[0x1E4F1C978] arrayWithArray:v7];

  if (v5)
  {
    if (v5 == v6)
    {
      float v5 = v6;
    }
    else
    {
      float v11 = v6 - 3;
      float v12 = v11;
      double v13 = v11;
      do
      {
        double v14 = *v13;
        v13 -= 3;
        (*v14)(v12);
        v11 -= 3;
        BOOL v15 = v12 == v5;
        float v12 = v13;
      }
      while (!v15);
      float v6 = v5;
    }
    (*(void (**)(uint64_t, void (***)(void), uint64_t))(*(void *)v20 + 40))(v20, v5, v19 - (void)v6);
  }
  return (NSArray *)v10;
}

- (NSArray)relatedSubTexts
{
  ptr = self->_labelMarker.__ptr_;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:(uint64_t)(*((void *)ptr + 25) - *((void *)ptr + 24)) >> 5];
  id v4 = (uint64_t *)*((void *)ptr + 24);
  for (i = (uint64_t *)*((void *)ptr + 25); v4 != i; v4 += 4)
  {
    if (*((char *)v4 + 23) >= 0) {
      float v6 = v4;
    }
    else {
      float v6 = (uint64_t *)*v4;
    }
    float v7 = [NSString stringWithUTF8String:v6];
    if (v7) {
      [v3 addObject:v7];
    }
  }
  float v8 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];

  return (NSArray *)v8;
}

- (NSArray)relatedTexts
{
  ptr = self->_labelMarker.__ptr_;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:(uint64_t)(*((void *)ptr + 21) - *((void *)ptr + 20)) >> 5];
  id v4 = (uint64_t *)*((void *)ptr + 20);
  for (i = (uint64_t *)*((void *)ptr + 21); v4 != i; v4 += 4)
  {
    if (*((char *)v4 + 23) >= 0) {
      float v6 = v4;
    }
    else {
      float v6 = (uint64_t *)*v4;
    }
    float v7 = [NSString stringWithUTF8String:v6];
    if (v7) {
      [v3 addObject:v7];
    }
  }
  float v8 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];

  return (NSArray *)v8;
}

- (id)featureHandles
{
  (*(void (**)(unsigned __int8 **__return_ptr))(*(void *)self->_labelMarker.__ptr_ + 552))(&v16);
  id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = (void *)[v2 initWithCapacity:(v17 - v16) >> 6];
  id v4 = v16;
  for (i = v17; v4 != i; v4 += 64)
  {
    float v6 = [VKMarkerFeatureHandle alloc];
    unint64_t v7 = *v4;
    if (v7 > 0x1B) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = dword_1A2961DF8[v7];
    }
    int v9 = [(VKMarkerFeatureHandle *)v6 initWithMarkerHandle:v4 featureType:v8];
    if (v9) {
      [v3 addObject:v9];
    }
  }
  float v10 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];

  float v11 = v16;
  if (v16)
  {
    float v12 = v17;
    double v13 = v16;
    if (v17 != v16)
    {
      do
      {
        double v14 = (std::__shared_weak_count *)*((void *)v12 - 1);
        if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *, unsigned __int8 *))v14->__on_zero_shared)(v14, v13);
          std::__shared_weak_count::__release_weak(v14);
        }
        v12 -= 64;
      }
      while (v12 != v11);
      double v13 = v16;
    }
    uint64_t v17 = v11;
    (*(void (**)(uint64_t, unsigned __int8 *, uint64_t))(*(void *)v19 + 40))(v19, v13, v18 - (void)v13);
  }
  return v10;
}

- (id)arWalkingFeature
{
  return (id)(*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 408))();
}

- (BOOL)isARWalkingFeature
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 200))();
}

- (id)featureAnnotation
{
  return (id)(*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 424))();
}

- (id)routeAnnotations
{
  (*(void (**)(LabelMarker *, SEL))(*(void *)self->_labelMarker.__ptr_ + 416))(self->_labelMarker.__ptr_, a2);
  id v2 = (void *)MEMORY[0x1E4F1C978];
  return (id)objc_msgSend(v2, "arrayWithObjects:count:");
}

- (id)waypointInfo
{
  return (id)(*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 400))();
}

- (id)routeInfo
{
  return (id)(*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 392))();
}

- (id)trafficCamera
{
  return 0;
}

- (id)incident
{
  return (id)(*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 384))();
}

- (int)featureType
{
  unint64_t v2 = *((unsigned __int8 *)self->_labelMarker.__ptr_ + 225);
  if (v2 > 0x1B) {
    return 0;
  }
  else {
    return dword_1A2961DF8[v2];
  }
}

- (BOOL)positionOfInterest:(id *)a3 zoom:(float *)a4
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v6 = ($F24F406B2B787EFB06265DBA3D28CBD5)vdupq_n_s64(0xC066800000000000);
  uint64_t v7 = 0x7FEFFFFFFFFFFFFFLL;
  BOOL result = (*(uint64_t (**)(LabelMarker *, $F24F406B2B787EFB06265DBA3D28CBD5 *, float *))(*(void *)self->_labelMarker.__ptr_
                                                                                                  + 632))(self->_labelMarker.__ptr_, &v6, a4);
  *a3 = v6;
  return result;
}

- (unsigned)venueComponentType
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 88))();
}

- (BOOL)hasVenueLookInsideFloorOrdinal
{
  (*(void (**)(BOOL *__return_ptr))(*(void *)self->_labelMarker.__ptr_ + 80))(&var4);
  return var4;
}

- (signed)venueLookInsideFloorOrdinal
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)self->_labelMarker.__ptr_ + 80))(&var4);
  if ((_BYTE)var4) {
    return WORD1(var4);
  }
  else {
    return 0;
  }
}

- (signed)venueFloorOrdinal
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 72))();
}

- (unint64_t)venueComponentID
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 64))();
}

- (unint64_t)venueLevelID
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 56))();
}

- (unint64_t)venueBuildingID
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 48))();
}

- (unint64_t)venueID
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 40))();
}

- (unint64_t)countFeatureIDs
{
  return (uint64_t)(*((void *)self->_labelMarker.__ptr_ + 5) - *((void *)self->_labelMarker.__ptr_ + 4)) >> 3;
}

- (const)featureIDs
{
  return (const unint64_t *)*((void *)self->_labelMarker.__ptr_ + 4);
}

- (unint64_t)featureLabelIdentifier
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 208))();
}

- (unint64_t)clientFeatureID
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 312))();
}

- (unint64_t)businessID
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 296))();
}

- (BOOL)hasBusinessID
{
  return (*(uint64_t (**)(LabelMarker *, SEL))(*(void *)self->_labelMarker.__ptr_ + 296))(self->_labelMarker.__ptr_, a2) != 0;
}

- (BOOL)isTrail
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 288))();
}

- (BOOL)isTransitAccessPoint
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 256))();
}

- (BOOL)isTransitLine
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 248))();
}

- (BOOL)isTransit
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 240))();
}

- (BOOL)isFlyoverTour
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 216))();
}

- (BOOL)isVenueButton
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 376))();
}

- (BOOL)isRouteAnnotation
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 192))();
}

- (BOOL)isRouteWaypoint
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 184))();
}

- (BOOL)isRouteEta
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 168))();
}

- (BOOL)isTrafficCamera
{
  return 0;
}

- (BOOL)isTrafficIncident
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 160))();
}

- (BOOL)isOneWayArrow
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 152))();
}

- (BOOL)isOccluded
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 488))();
}

- (BOOL)isTextVisible
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 472))();
}

- (BOOL)isVisible
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 464))();
}

- (BOOL)isAlongSelectedTransitLine
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 480))();
}

- (BOOL)isOnRoute
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 264))();
}

- (void)setUseVKSelectionBalloon:(BOOL)a3
{
}

- (BOOL)useVKSelectionBalloon
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 528))();
}

- (void)setIsDragged:(BOOL)a3
{
}

- (BOOL)isDragged
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 496))();
}

- (BOOL)isSelected
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 440))();
}

- (BOOL)isSelectable
{
  return (*(uint64_t (**)(void))(*(void *)self->_labelMarker.__ptr_ + 432))();
}

- (CGRect)calloutAnchorRect
{
  [(VKLabelMarker *)self _calloutAnchorRect:0];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)lateralCalloutAnchorRect
{
  [(VKLabelMarker *)self _calloutAnchorRect:1];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)_calloutAnchorRect:(BOOL)a3
{
  float v4 = (*(float (**)(LabelMarker *, BOOL))(*(void *)self->_labelMarker.__ptr_ + 560))(self->_labelMarker.__ptr_, a3);
  float v5 = 1.0 / *((float *)self->_labelMarker.__ptr_ + 62);
  double v7 = (float)-(float)(v6 * v5);
  double v9 = (float)((float)(v8 - v4) * v5);
  double v11 = (float)((float)(v6 - v10) * v5);
  double v12 = (float)(v4 * v5);
  double v13 = v7;
  result.size.height = v11;
  result.size.width = v9;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)mapRegion
{
  [(VKLabelMarker *)self _bounds];
  double v3 = v2;
  double v5 = v4;
  long double v7 = v6 * 6.28318531;
  long double v9 = exp(v8 * 6.28318531 + -3.14159265);
  double v10 = atan(v9);
  long double v11 = fmod(v7, 6.28318531);
  double v12 = fmod(v11 + 6.28318531, 6.28318531);
  long double v13 = fmod(v5 * 6.28318531, 6.28318531);
  double v14 = fmod(v13 + 6.28318531, 6.28318531);
  id v15 = objc_alloc_init(MEMORY[0x1E4F64700]);
  [v15 setNorthLat:v10 * 114.591559 + -90.0];
  long double v16 = exp(v3 * 6.28318531 + -3.14159265);
  [v15 setSouthLat:(double)(atan(v16) * 114.591559 + -90.0)];
  [v15 setEastLng:v14 * 57.2957795 + -180.0];
  [v15 setWestLng:v12 * 57.2957795 + -180.0];
  return v15;
}

- (Box<double,)_bounds
{
  [(VKLabelMarker *)self coordinate];
  double v4 = v3;
  [(VKLabelMarker *)self coordinate];
  double v6 = v5;
  long double v7 = tan(v4 * 0.00872664626 + 0.785398163);
  long double v8 = log(v7);
  double v9 = v6 * 0.00277777778 + 0.5;
  double v10 = v8 * 0.159154943 + 0.5;
  double v11 = v9;
  double v12 = v10;
  result._maximum._e[1] = v12;
  result._maximum._e[0] = v9;
  result._minimum._e[1] = v10;
  result._minimum._e[0] = v11;
  return result;
}

- (BOOL)hasFacingDirection
{
  return ((*(uint64_t (**)(LabelMarker *, SEL))(*(void *)self->_labelMarker.__ptr_ + 624))(self->_labelMarker.__ptr_, a2) & 0xFF00000000) != 0;
}

- (float)facingDirection
{
  uint64_t v2 = (*(uint64_t (**)(LabelMarker *, SEL))(*(void *)self->_labelMarker.__ptr_ + 624))(self->_labelMarker.__ptr_, a2);
  float result = *(float *)&v2;
  if ((v2 & 0xFF00000000) == 0) {
    return 0.0;
  }
  return result;
}

- (float)buildingFaceAzimuth
{
  uint64_t v2 = (*(uint64_t (**)(LabelMarker *, SEL))(*(void *)self->_labelMarker.__ptr_ + 608))(self->_labelMarker.__ptr_, a2);
  float result = *(float *)&v2;
  if ((v2 & 0xFF00000000) == 0) {
    return 0.0;
  }
  return result;
}

- (BOOL)hasBuildingFaceAzimuth
{
  return ((*(uint64_t (**)(LabelMarker *, SEL))(*(void *)self->_labelMarker.__ptr_ + 608))(self->_labelMarker.__ptr_, a2) & 0xFF00000000) != 0;
}

- (float)buildingHeight
{
  (*(void (**)(void))(*(void *)self->_labelMarker.__ptr_ + 600))();
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinate3D
{
  (*(void (**)(void *__return_ptr))(*(void *)self->_labelMarker.__ptr_ + 584))(v5);
  double v2 = *(double *)v5;
  double v3 = *(double *)&v5[1];
  double v4 = *(double *)&v5[2];
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (NSArray)transitSystems
{
  (*(void (**)(uint64_t **__return_ptr))(*(void *)self->_labelMarker.__ptr_ + 544))(&v13);
  id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
  double v3 = (void *)[v2 initWithCapacity:((char *)v14 - (char *)v13) >> 5];
  double v4 = v13;
  for (i = v14; v4 != i; v4 += 4)
  {
    if (*((char *)v4 + 23) >= 0) {
      double v6 = v4;
    }
    else {
      double v6 = (uint64_t *)*v4;
    }
    long double v7 = [NSString stringWithUTF8String:v6];
    if (v7) {
      [v3 addObject:v7];
    }
  }
  long double v8 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];

  double v9 = v13;
  if (v13)
  {
    double v10 = v14;
    double v11 = v13;
    if (v14 != v13)
    {
      do
      {
        if (*((char *)v10 - 9) < 0) {
          (*(void (**)(void, void, uint64_t))(*(void *)*(v10 - 1) + 40))(*(v10 - 1), *(v10 - 4), *(v10 - 2) & 0x7FFFFFFFFFFFFFFFLL);
        }
        v10 -= 4;
      }
      while (v10 != v9);
      double v11 = v13;
    }
    double v14 = v9;
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)v16 + 40))(v16, v11, v15 - (void)v11);
  }
  return (NSArray *)v8;
}

- (NSArray)iconImageKeys
{
  p_labelMarker = &self->_labelMarker;
  if (((*(uint64_t (**)(LabelMarker *, SEL))(*(void *)self->_labelMarker.__ptr_ + 272))(self->_labelMarker.__ptr_, a2) & 1) != 0|| (*(unsigned int (**)(LabelMarker *))(*(void *)p_labelMarker->__ptr_ + 280))(p_labelMarker->__ptr_))
  {
    (*(void (**)(uint64_t *__return_ptr))(*(void *)p_labelMarker->__ptr_ + 688))(&v36);
    cntrl = p_labelMarker->__cntrl_;
    uint64_t ptr = (uint64_t)p_labelMarker->__ptr_;
    v35 = (std::__shared_weak_count *)cntrl;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
    double v5 = (void *)[v4 initWithCapacity:0xAAAAAAAAAAAAAAABLL * ((v37 - v36) >> 3)];
    uint64_t v6 = v36;
    uint64_t v7 = v37;
    if (v36 != v37)
    {
      long double v8 = (double *)MEMORY[0x1E4F1DAD8];
      while (1)
      {
        double v9 = [[VKImageSourceKey alloc] initWithLabelImageKey:v6];
        if (v9) {
          break;
        }
LABEL_7:

        v6 += 24;
        if (v6 == v7) {
          goto LABEL_18;
        }
      }
      md::LabelMarker::acquireDisplayLock((md::LabelMarker *)&v39, ptr);
      if (v39)
      {
        float v10 = *(float *)(ptr + 248);
        double v11 = (float)(*(float *)(v6 + 16) / v10);
        double v12 = (float)((float)(*(float *)(v39 + 1508) - *(float *)(v6 + 20)) / v10);
        if (!(_BYTE)v42) {
          goto LABEL_12;
        }
      }
      else
      {
        double v11 = *v8;
        double v12 = v8[1];
        if (!(_BYTE)v42)
        {
LABEL_12:
          long double v13 = v40;
          if (v40 && !atomic_fetch_add(&v40->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
            std::__shared_weak_count::__release_weak(v13);
          }
          -[VKImageSourceKey setImageCenter:](v9, "setImageCenter:", v11, v12, ptr);
          [v5 addObject:v9];
          goto LABEL_7;
        }
      }
      std::recursive_mutex::unlock(v41);
      goto LABEL_12;
    }
LABEL_18:
    double v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", v5, ptr);

    if (v35 && !atomic_fetch_add(&v35->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
    uint64_t v15 = v36;
    if (v36)
    {
      uint64_t v16 = v37;
      uint64_t v17 = v36;
      if (v37 != v36)
      {
        do
        {
          uint64_t v18 = *(std::__shared_weak_count **)(v16 - 16);
          if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *, uint64_t))v18->__on_zero_shared)(v18, v17);
            std::__shared_weak_count::__release_weak(v18);
          }
          v16 -= 24;
        }
        while (v16 != v15);
      }
      uint64_t v37 = v15;
      uint64_t v19 = *(void (**)(void))(*(void *)v38 + 40);
LABEL_40:
      v19();
    }
  }
  else
  {
    uint64_t v20 = (uint64_t *)p_labelMarker->__ptr_;
    uint64_t v39 = 0;
    v40 = 0;
    uint64_t v21 = v20[15];
    v41 = 0;
    uint64_t v42 = v21;
    std::vector<geo::_retain_ptr<VKImageSourceKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,geo::StdAllocator<geo::_retain_ptr<VKImageSourceKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,mdm::Allocator>>::__init_with_size[abi:nn180100]<geo::_retain_ptr<VKImageSourceKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*,geo::_retain_ptr<VKImageSourceKey * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>*>((uint64_t)&v39, v20[12], v20[13], 0xAAAAAAAAAAAAAAABLL * ((v20[13] - v20[12]) >> 3));
    id v22 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v23 = (std::__shared_weak_count *)v39;
    v24 = v40;
    v25 = (void *)[v22 initWithCapacity:0xAAAAAAAAAAAAAAABLL * (((uint64_t)v40 - v39) >> 3)];
    if (v23 != v24)
    {
      v26 = v23;
      do
      {
        v27 = (void (**)(void))(id)v26->__shared_owners_;
        if (v27) {
          [v25 addObject:v27];
        }

        ++v26;
      }
      while (v26 != v24);
    }
    double v14 = [MEMORY[0x1E4F1C978] arrayWithArray:v25];

    if (v23)
    {
      if (v23 != v24)
      {
        v28 = v24 - 1;
        v29 = v28;
        v30 = v28;
        do
        {
          v31 = (void (**)(std::__shared_weak_count *))v30->__vftable;
          --v30;
          (*v31)(v29);
          --v28;
          BOOL v32 = v29 == v23;
          v29 = v30;
        }
        while (!v32);
      }
      uint64_t v19 = *(void (**)(void))(*(void *)v42 + 40);
      goto LABEL_40;
    }
  }
  return (NSArray *)v14;
}

- (NSArray)dataIconImageKeys
{
  (*(void (**)(void (****__return_ptr)(void, void)))(*(void *)self->_labelMarker.__ptr_
                                                                             + 680))(&v16);
  id v2 = v16;
  if (v16 == v17)
  {
    long double v8 = 0;
    if (!v16) {
      goto LABEL_16;
    }
  }
  else
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v4 = (void *)[v3 initWithCapacity:0xAAAAAAAAAAAAAAABLL * (v17 - v16)];
    double v5 = v16;
    uint64_t v6 = v17;
    while (v5 != v6)
    {
      id v7 = v5[1];
      if (v7) {
        [v4 addObject:v7];
      }

      v5 += 3;
    }
    long double v8 = [MEMORY[0x1E4F1C978] arrayWithArray:v4];

    id v2 = v16;
    if (!v16) {
      goto LABEL_16;
    }
  }
  double v9 = v2;
  if (v17 != v2)
  {
    float v10 = v17 - 3;
    double v11 = v17 - 3;
    double v12 = v17 - 3;
    do
    {
      long double v13 = *v12;
      v12 -= 3;
      (*v13)(v11, v9);
      v10 -= 3;
      BOOL v14 = v11 == v2;
      double v11 = v12;
    }
    while (!v14);
    double v9 = v16;
  }
  uint64_t v17 = v2;
  (*(void (**)(uint64_t, void (***)(void, void), uint64_t))(*(void *)v19 + 40))(v19, v9, v18 - (void)v9);
LABEL_16:
  return (NSArray *)v8;
}

- (id)locale
{
  id v2 = NSString;
  (*(void (**)(void *__return_ptr))(*(void *)self->_labelMarker.__ptr_ + 144))(v6);
  if (v7 >= 0) {
    id v3 = v6;
  }
  else {
    id v3 = (void *)v6[0];
  }
  id v4 = [v2 stringWithUTF8String:v3];
  if (SHIBYTE(v7) < 0) {
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)v8 + 40))(v8, v6[0], v7 & 0x7FFFFFFFFFFFFFFFLL);
  }
  return v4;
}

- (id)subtext
{
  id v2 = NSString;
  (*(void (**)(void *__return_ptr))(*(void *)self->_labelMarker.__ptr_ + 136))(v6);
  if (v7 >= 0) {
    id v3 = v6;
  }
  else {
    id v3 = (void *)v6[0];
  }
  id v4 = [v2 stringWithUTF8String:v3];
  if (SHIBYTE(v7) < 0) {
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)v8 + 40))(v8, v6[0], v7 & 0x7FFFFFFFFFFFFFFFLL);
  }
  return v4;
}

- (id)text
{
  id v2 = NSString;
  (*(void (**)(void *__return_ptr))(*(void *)self->_labelMarker.__ptr_ + 128))(v6);
  if (v7 >= 0) {
    id v3 = v6;
  }
  else {
    id v3 = (void *)v6[0];
  }
  id v4 = [v2 stringWithUTF8String:v3];
  if (SHIBYTE(v7) < 0) {
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)v8 + 40))(v8, v6[0], v7 & 0x7FFFFFFFFFFFFFFFLL);
  }
  return v4;
}

- (const)labelMarkerImpl
{
  return &self->_labelMarker;
}

- (VKLabelMarker)initWithLabelMarkerPtr:(const void *)a3
{
  id v4 = (std::__shared_weak_count *)*((void *)a3 + 1);
  double v12 = *(LabelMarker **)a3;
  long double v13 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v11.receiver = self;
  v11.super_class = (Class)VKLabelMarker;
  double v5 = [(VKMarker *)&v11 initWithFeatureMarkerPtr:&v12 markerType:1];
  uint64_t v6 = v13;
  if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
  if (v5)
  {
    uint64_t v8 = *(LabelMarker **)a3;
    uint64_t v7 = *((void *)a3 + 1);
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v5->_labelMarker.__cntrl_;
    v5->_labelMarker.__ptr_ = v8;
    v5->_labelMarker.__cntrl_ = (__shared_weak_count *)v7;
    if (cntrl && !atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
  }
  return v5;
}

@end