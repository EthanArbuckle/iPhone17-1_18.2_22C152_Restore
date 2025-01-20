@interface VKLabelNavRoadLabel
- (BOOL)isEtaLabel;
- (BOOL)isJunctionLabel;
- (BOOL)isManeuverLabel;
- (BOOL)isRoadLabel;
- (BOOL)isShieldLabel;
- (BOOL)isTrafficCameraLabel;
- (Mercator2<double>)mercatorPoint;
- (VKLabelNavFeature)navFeature;
- (VKLabelNavRoadLabel)initWithNavFeature:(id)a3 label:(const void *)a4 navLabelType:(int)a5;
- (const)label;
- (float)desiredOffsetDistance;
- (id).cxx_construct;
- (id)description;
- (id)displayGroup;
- (unsigned)alignment;
- (unsigned)displayID;
- (unsigned)renderOrder;
- (void)layoutForStagingWithNavContext:(NavContext *)a3;
- (void)layoutWithNavContext:(NavContext *)a3;
- (void)setAlignment:(unsigned __int8)a3;
- (void)setDesiredOffsetDistance:(float)a3;
- (void)setDisplayID:(unsigned int)a3;
- (void)setMercatorPoint:(Mercator2<double>)a3;
- (void)setNavFeature:(id)a3;
- (void)setRenderOrder:(unsigned __int16)a3;
@end

@implementation VKLabelNavRoadLabel

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayGroup, 0);
  objc_destroyWeak((id *)&self->_navFeature);
  cntrl = self->_label.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (void)setMercatorPoint:(Mercator2<double>)a3
{
  self->_mercatorPoint = *v3;
}

- (Mercator2<double>)mercatorPoint
{
  Mercator2<double> mercatorPoint = self->_mercatorPoint;
  Mercator2<double> *v2 = mercatorPoint;
  result._e[0] = mercatorPoint._e[0];
  return result;
}

- (void)setDesiredOffsetDistance:(float)a3
{
  self->_desiredOffsetDistance = a3;
}

- (float)desiredOffsetDistance
{
  return self->_desiredOffsetDistance;
}

- (void)setAlignment:(unsigned __int8)a3
{
  self->_alignment = a3;
}

- (unsigned)alignment
{
  return self->_alignment;
}

- (void)setDisplayID:(unsigned int)a3
{
  self->_displayID = a3;
}

- (unsigned)displayID
{
  return self->_displayID;
}

- (const)label
{
  return &self->_label;
}

- (void)setNavFeature:(id)a3
{
}

- (VKLabelNavFeature)navFeature
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navFeature);
  return (VKLabelNavFeature *)WeakRetained;
}

- (id)description
{
  v3 = NSString;
  v4 = [(VKLabelNavRoadLabel *)self displayGroup];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navFeature);
  v6 = [v3 stringWithFormat:@"%@, (%@)", v4, WeakRetained];

  return v6;
}

- (id)displayGroup
{
  displayGroup = self->_displayGroup;
  if (!displayGroup)
  {
    if (self->_displayID)
    {
      v4 = (NSString *)objc_msgSend([NSString alloc], "initWithFormat:", @"DI$_%X", self->_displayID);
      id WeakRetained = self->_displayGroup;
      self->_displayGroup = v4;
    }
    else
    {
      if ([(VKLabelNavRoadLabel *)self isShieldLabel])
      {
        id v6 = [NSString alloc];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_navFeature);
        v7 = [WeakRetained shieldDisplayGroup];
        v8 = (NSString *)[v6 initWithFormat:@"SH$_%@", v7];
      }
      else
      {
        if (![(VKLabelNavRoadLabel *)self isJunctionLabel])
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_navFeature);
          v11 = [WeakRetained name];
          v12 = self->_displayGroup;
          self->_displayGroup = v11;

          goto LABEL_10;
        }
        id v9 = [NSString alloc];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_navFeature);
        v7 = [WeakRetained name];
        v8 = (NSString *)[v9 initWithFormat:@"JC$_%@", v7];
      }
      v10 = self->_displayGroup;
      self->_displayGroup = v8;
    }
LABEL_10:

    displayGroup = self->_displayGroup;
  }
  return displayGroup;
}

- (void)layoutForStagingWithNavContext:(NavContext *)a3
{
}

- (void)layoutWithNavContext:(NavContext *)a3
{
  md::NavLabel::layoutForStagingWithNavContext((md::NavLabel *)self->_label.__ptr_, (md::NavContext *)a3);
  ptr = self->_label.__ptr_;
  *((_DWORD *)ptr + 81) = *((_DWORD *)ptr + 74);
  *((void *)ptr + 41) = *(void *)((char *)ptr + 300);
  if (*((unsigned char *)ptr + 280))
  {
    *((_DWORD *)ptr + 67) = *((_DWORD *)ptr + 69);
    *((unsigned char *)ptr + 280) = 0;
  }
  uint64_t v6 = *((void *)ptr + 36);
  if (v6)
  {
    (*(void (**)(void))(*(void *)v6 + 968))(*((void *)ptr + 36));
    ptr = self->_label.__ptr_;
  }
  md::NavLabel::layoutForDisplayWithNavContext((float32x2_t *)ptr, (float64x2_t **)a3);
}

- (BOOL)isTrafficCameraLabel
{
  return self->_navLabelType == 6;
}

- (BOOL)isEtaLabel
{
  return self->_navLabelType == 5;
}

- (BOOL)isManeuverLabel
{
  return self->_navLabelType == 4;
}

- (BOOL)isJunctionLabel
{
  return self->_navLabelType == 3;
}

- (BOOL)isRoadLabel
{
  return self->_navLabelType == 1;
}

- (BOOL)isShieldLabel
{
  return self->_navLabelType == 2;
}

- (unsigned)renderOrder
{
  ptr = self->_label.__ptr_;
  if (ptr) {
    return *(_WORD *)(*((void *)ptr + 36) + 558);
  }
  else {
    return 0;
  }
}

- (void)setRenderOrder:(unsigned __int16)a3
{
  ptr = self->_label.__ptr_;
  if (ptr) {
    (*(void (**)(void, void))(**((void **)ptr + 36) + 824))(*((void *)ptr + 36), a3);
  }
}

- (VKLabelNavRoadLabel)initWithNavFeature:(id)a3 label:(const void *)a4 navLabelType:(int)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VKLabelNavRoadLabel;
  id v9 = [(VKLabelNavRoadLabel *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_navFeature, v8);
    v10->_navLabelType = a5;
    v12 = *(NavLabel **)a4;
    uint64_t v11 = *((void *)a4 + 1);
    if (v11) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v10->_label.__cntrl_;
    v10->_label.__ptr_ = v12;
    v10->_label.__cntrl_ = (__shared_weak_count *)v11;
    if (cntrl && !atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
    v14 = v10;
  }

  return v10;
}

@end