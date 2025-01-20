@interface VKLabelNavRouteEta
+ (RoadSignStyleGroup)styleForNavContext:(SEL)a3 selected:(const NavContext *)a4 focused:(BOOL)a5 etaComparison:(BOOL)a6 transportType:(unsigned __int8)a7 navLabelType:(unsigned __int8)a8 when:(unsigned __int8)a9 routeLegWhen:(optional<gss:(optional<gss:(id)a12 :RouteLegWhen>)a11 :When>)a10 additionalAttributes:;
+ (id)artworkForEtaDescription:(id)a3 navContext:(const NavContext *)a4 roadSignStyleGroup:(const void *)a5 mercatorPoint:(const void *)a6 orientation:(unsigned __int8)a7 isSelected:(BOOL)a8 artworkCache:(void *)a9;
+ (unsigned)toStyleEtaComparison:(unsigned __int8)a3;
+ (unsigned)toStyleNavLabelType:(int64_t)a3;
+ (vector<GeoCodecsFeatureStylePair,)baseAttributesForEtaLabel:(mdm:(id)a2 :(SEL)a3 Allocator>> *__return_ptr)retstr focused:(BOOL)a4 etaComparison:(BOOL)a5 transportType:(unsigned __int8)a6 navLabelType:(unsigned __int8)a7 when:(unsigned __int8)a8 routeLegWhen:(optional<gss:(optional<gss:(id)a11 :RouteLegWhen>)a10 :When>)a9 additionalAttributes:;
- (BOOL)didStyleChange;
- (BOOL)hasAnchor;
- (BOOL)hasLabel;
- (BOOL)hasLabelWithAnchor;
- (BOOL)isAwayFromRoute;
- (BOOL)isEtaFeature;
- (BOOL)isGuidanceStepStart;
- (BOOL)isInGuidance;
- (BOOL)isOnRoute;
- (BOOL)isPicked;
- (BOOL)isRamp;
- (BOOL)isRepositioning;
- (BOOL)isStartOfRoadName;
- (BOOL)isTrafficCameraFeature;
- (BOOL)isValid;
- (BOOL)selected;
- (Matrix<double,)worldPointForStaging;
- (NSString)name;
- (NSString)shieldDisplayGroup;
- (PolylineCoordinate)routeOffset;
- (VKLabelNavRoadLabel)label;
- (VKLabelNavRouteEta)initWithRouteInfo:(id)a3 routeCoord:(PolylineCoordinate)a4;
- (VKRouteEtaDescription)displayEtaDescription;
- (VKRouteInfo)routeInfo;
- (_retain_ptr<VKLabelNavRoadLabel)updateRoadSignWithNavContext:(const NavContext *)a3 artworkCache:(void *)a4;
- (double)worldUnitsPerMeterAtPoint;
- (id).cxx_construct;
- (int64_t)intraRoadPriorityForRoadLabel;
- (int64_t)intraRoadPriorityForShieldLabel;
- (optional<gss::RouteLegWhen>)routeLegWhen;
- (optional<gss::When>)when;
- (unsigned)etaComparisonToMain;
- (unsigned)orientation;
- (void)clearLabel;
- (void)createLabelWithNavContext:(const NavContext *)a3 orientation:(unsigned __int8)a4 etaDescription:(id)a5 selected:(BOOL)a6 when:(optional<gss:(optional<gss:(void *)a9 :RouteLegWhen>)a8 :When>)a7 routeLegWhen:artworkCache:;
- (void)dealloc;
- (void)repositionAtRouteCoord:(PolylineCoordinate)a3;
- (void)setDidStyleChange:(BOOL)a3;
- (void)setIsPicked:(BOOL)a3;
- (void)setIsRepositioning:(BOOL)a3;
- (void)setOrientation:(unsigned __int8)a3;
- (void)setRouteInfo:(id)a3;
- (void)setRouteLegWhen:(optional<gss::RouteLegWhen>)a3;
- (void)setSelected:(BOOL)a3;
- (void)setWhen:(optional<gss::When>)a3;
- (void)updateAnchorWithContext:(const NavContext *)a3;
@end

@implementation VKLabelNavRouteEta

- (id).cxx_construct
{
  *(void *)((char *)self + 28) = 0xBF80000000000000;
  *(_WORD *)((char *)self + 59) = 0;
  *((unsigned char *)self + 104) = 0;
  return self;
}

- (void).cxx_destruct
{
  if (self->_routeLegWhen._hasValue) {
    self->_routeLegWhen._hasValue = 0;
  }
  objc_storeStrong((id *)&self->_displayEtaDescription, 0);
  objc_storeStrong((id *)&self->_routeInfo, 0);
  objc_storeStrong((id *)&self->_etaLabel, 0);
}

- (void)setDidStyleChange:(BOOL)a3
{
  self->_didStyleChange = a3;
}

- (BOOL)didStyleChange
{
  return self->_didStyleChange;
}

- (void)setRouteLegWhen:(optional<gss::RouteLegWhen>)a3
{
  BOOL hasValue = self->_routeLegWhen._hasValue;
  if (**(unsigned char **)&a3._hasValue)
  {
    *(&self->_routeLegWhen._hasValue + 1) = *(unsigned char *)(*(void *)&a3._hasValue + 1);
    if (!hasValue) {
      self->_routeLegWhen._BOOL hasValue = 1;
    }
  }
  else if (self->_routeLegWhen._hasValue)
  {
    self->_routeLegWhen._BOOL hasValue = 0;
  }
}

- (optional<gss::RouteLegWhen>)routeLegWhen
{
  unsigned char *v2 = 0;
  if (self->_routeLegWhen._hasValue)
  {
    v2[1] = *(&self->_routeLegWhen._hasValue + 1);
    unsigned char *v2 = 1;
  }
  result._value = (ValueUnion)a2;
  result._BOOL hasValue = (char)self;
  return result;
}

- (double)worldUnitsPerMeterAtPoint
{
  return self->_worldUnitsPerMeterAtPoint;
}

- (void)setWhen:(optional<gss::When>)a3
{
  self->_when = a3;
}

- (optional<gss::When>)when
{
  return self->_when;
}

- (void)setIsRepositioning:(BOOL)a3
{
  self->_isRepositioning = a3;
}

- (BOOL)isRepositioning
{
  return self->_isRepositioning;
}

- (void)setIsPicked:(BOOL)a3
{
  self->_isPicked = a3;
}

- (BOOL)isPicked
{
  return self->_isPicked;
}

- (VKRouteEtaDescription)displayEtaDescription
{
  return self->_displayEtaDescription;
}

- (void)setRouteInfo:(id)a3
{
}

- (VKRouteInfo)routeInfo
{
  return self->_routeInfo;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)selected
{
  return self->_selected;
}

- (VKLabelNavRoadLabel)label
{
  return self->_etaLabel;
}

- (PolylineCoordinate)routeOffset
{
  return self->_routeOffset;
}

- (BOOL)isAwayFromRoute
{
  return self->_isAwayFromRoute;
}

- (BOOL)isOnRoute
{
  return self->_isOnRoute;
}

- (void)repositionAtRouteCoord:(PolylineCoordinate)a3
{
  self->_isRepositioning = 1;
  self->_routeOffset = a3;
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)isTrafficCameraFeature
{
  return 0;
}

- (BOOL)isEtaFeature
{
  return 1;
}

- (int64_t)intraRoadPriorityForShieldLabel
{
  return 0;
}

- (int64_t)intraRoadPriorityForRoadLabel
{
  return 0;
}

- (BOOL)isGuidanceStepStart
{
  return 0;
}

- (BOOL)isInGuidance
{
  return 0;
}

- (BOOL)isStartOfRoadName
{
  return 0;
}

- (NSString)shieldDisplayGroup
{
  return 0;
}

- (NSString)name
{
  return 0;
}

- (BOOL)isRamp
{
  return 0;
}

- (_retain_ptr<VKLabelNavRoadLabel)updateRoadSignWithNavContext:(const NavContext *)a3 artworkCache:(void *)a4
{
  v6 = v4;
  if ([(VKLabelNavRouteEta *)self isRepositioning]) {
    goto LABEL_16;
  }
  char v39 = [(VKLabelNavRouteEta *)self orientation];
  BOOL v41 = [(VKLabelNavRouteEta *)self selected];
  v42 = [(VKLabelNavRouteEta *)self routeInfo];
  unsigned int v40 = [v42 hasFocus];
  uint64_t v7 = [(VKLabelNavRouteEta *)self etaComparisonToMain];
  v8 = [(VKRouteInfo *)self->_routeInfo route];
  unsigned int v9 = [v8 transportType];
  if (v9 >= 7) {
    unsigned __int8 v10 = 4;
  }
  else {
    unsigned __int8 v10 = 0x50403020100uLL >> (8 * v9);
  }
  v11 = [(VKLabelNavRouteEta *)self displayEtaDescription];
  uint64_t v12 = +[VKLabelNavRouteEta toStyleNavLabelType:](VKLabelNavRouteEta, "toStyleNavLabelType:", [v11 routeEtaType]);
  optional<gss::When> v13 = (optional<gss::When>)[(VKLabelNavRouteEta *)self when];
  [(VKLabelNavRouteEta *)self routeLegWhen];
  v14 = [(VKLabelNavRouteEta *)self displayEtaDescription];
  v15 = [v14 styleAttributes];
  +[VKLabelNavRouteEta styleForNavContext:a3 selected:v41 focused:v40 etaComparison:v7 transportType:v10 navLabelType:v12 when:*(unsigned __int16 *)&v13 routeLegWhen:v49 additionalAttributes:v15];

  if (v49[0]) {
    v49[0] = 0;
  }

  [(VKLabelNavRouteEta *)self worldPointForStaging];
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  v20 = [(VKLabelNavRouteEta *)self displayEtaDescription];
  v46[0] = v17;
  v46[1] = v19;
  [(VKLabelNavRouteEta *)self selected];
  artworkAndKeyForEtaLabel(&v47, v20, (uint64_t)a3, (uint64_t)v50, (unint64_t)v46, v39, a4);

  unint64_t etaLabelArtworkKey = self->_etaLabelArtworkKey;
  v22 = v47;
  uint64_t v23 = v48;
  self->_didStyleChange = v48 != etaLabelArtworkKey;

  v26 = v53;
  if (v53 && !atomic_fetch_add(&v53->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
    std::__shared_weak_count::__release_weak(v26);
  }
  v27 = v52;
  if (v52 && !atomic_fetch_add(&v52->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
    std::__shared_weak_count::__release_weak(v27);
  }
  v28 = v51;
  if (v51 && !atomic_fetch_add(&v51->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
    std::__shared_weak_count::__release_weak(v28);
    if (v23 != etaLabelArtworkKey) {
      goto LABEL_16;
    }
LABEL_27:
    void *v6 = off_1EF559858;
    v6[1] = 0;
    goto LABEL_28;
  }
  if (v23 == etaLabelArtworkKey) {
    goto LABEL_27;
  }
LABEL_16:
  uint64_t v29 = [(VKLabelNavRouteEta *)self label];
  void *v6 = off_1EF559858;
  v6[1] = v29;
  [(VKLabelNavRouteEta *)self clearLabel];
  uint64_t v30 = [(VKLabelNavRouteEta *)self orientation];
  v31 = [(VKLabelNavRouteEta *)self displayEtaDescription];
  BOOL v32 = [(VKLabelNavRouteEta *)self selected];
  optional<gss::When> v33 = (optional<gss::When>)[(VKLabelNavRouteEta *)self when];
  [(VKLabelNavRouteEta *)self routeLegWhen];
  [(VKLabelNavRouteEta *)self createLabelWithNavContext:a3 orientation:v30 etaDescription:v31 selected:v32 when:*(unsigned __int16 *)&v33 routeLegWhen:v45 artworkCache:a4];
  if (v45[0]) {
    v45[0] = 0;
  }

  BOOL v24 = [(VKLabelNavRouteEta *)self isRepositioning];
  if (v24)
  {
    v34 = (void *)v6[1];
    if (v34)
    {
      id v35 = v34;
      v36 = *(unsigned char **)[v35 label];
      v36[297] = 0;
      if (v36[296]) {
        v36[298] = 0;
      }
    }
    self->_isRepositioning = 0;
  }
  else
  {
    BOOL v24 = [(VKLabelNavRouteEta *)self hasLabel];
    if (v24)
    {
      v37 = [(VKLabelNavRouteEta *)self label];
      uint64_t v38 = *(void *)[v37 label];
      *(_DWORD *)(v38 + 276) = 1065353216;
      *(unsigned char *)(v38 + 280) = 1;
    }
  }
LABEL_28:
  result.var1 = v25;
  result.var0 = (void **)v24;
  return result;
}

- (void)updateAnchorWithContext:(const NavContext *)a3
{
  if (!*(void *)(*(void *)[(VKLabelNavRoadLabel *)self->_etaLabel label] + 160))
  {
    uint64_t v9 = **((void **)a3->var4 + 18);
    int v10 = *(unsigned __int8 *)(*((void *)a3->var1 + 29) + 30);
    double altitude = 0.0;
    if (!*(unsigned char *)(*((void *)a3->var1 + 29) + 30))
    {
      double altitude = self->_coordinate.altitude;
      if (!*((unsigned char *)a3->var3 + 24)) {
        double altitude = 0.0;
      }
    }
    long long v12 = *(_OWORD *)&self->_coordinate.latitude;
    double v13 = altitude;
    md::AnchorManager::newAnchorAtCoordinate(&v14, v9, (uint64_t)&v12, v10 != 0);
  }
  v5 = *(md::NavLabel **)[(VKLabelNavRoadLabel *)self->_etaLabel label];
  md::NavLabel::worldPointForDisplay(v5, (const md::NavContext *)a3);
  *((void *)v5 + 17) = v6;
  *((void *)v5 + 18) = v7;
  *((void *)v5 + 19) = v8;
}

- (void)createLabelWithNavContext:(const NavContext *)a3 orientation:(unsigned __int8)a4 etaDescription:(id)a5 selected:(BOOL)a6 when:(optional<gss:(optional<gss:(void *)a9 :RouteLegWhen>)a8 :When>)a7 routeLegWhen:artworkCache:
{
  int v10 = v9;
  BOOL v12 = a6;
  uint64_t v17 = (VKRouteEtaDescription *)a5;
  if (!self->_etaLabel)
  {
    displayEtaDescription = self->_displayEtaDescription;
    v50 = v17;
    location = (id *)&self->_displayEtaDescription;
    if (displayEtaDescription != v17 && ![(VKRouteEtaDescription *)displayEtaDescription isEqual:v17]) {
      objc_storeStrong(location, a5);
    }
    self->_selected = v12;
    self->_when = a7;
    BOOL hasValue = self->_routeLegWhen._hasValue;
    if (*v10)
    {
      *(&self->_routeLegWhen._hasValue + 1) = v10[1];
      if (!hasValue) {
        self->_routeLegWhen._BOOL hasValue = 1;
      }
    }
    else if (self->_routeLegWhen._hasValue)
    {
      self->_routeLegWhen._BOOL hasValue = 0;
    }
    self->_orientation = a4;
    v20 = [(VKRouteInfo *)self->_routeInfo route];
    [v20 pointWithAltitudeCorrectionAtRouteCoordinate:*(void *)&self->_routeOffset];
    double v49 = v21;
    double v23 = v22;
    double v25 = v24;

    v47 = [(VKLabelNavRouteEta *)self routeInfo];
    unsigned int v46 = [v47 hasFocus];
    uint64_t v26 = [(VKLabelNavRouteEta *)self etaComparisonToMain];
    v27 = [(VKRouteInfo *)self->_routeInfo route];
    unsigned int v28 = [v27 transportType];
    if (v28 >= 7) {
      unsigned __int8 v29 = 4;
    }
    else {
      unsigned __int8 v29 = 0x50403020100uLL >> (8 * v28);
    }
    uint64_t v30 = [(VKLabelNavRouteEta *)self displayEtaDescription];
    char v48 = a4;
    uint64_t v31 = +[VKLabelNavRouteEta toStyleNavLabelType:](VKLabelNavRouteEta, "toStyleNavLabelType:", [v30 routeEtaType]);
    optional<gss::When> v32 = (optional<gss::When>)[(VKLabelNavRouteEta *)self when];
    [(VKLabelNavRouteEta *)self routeLegWhen];
    optional<gss::When> v33 = [*location styleAttributes];
    +[VKLabelNavRouteEta styleForNavContext:a3 selected:v12 focused:v46 etaComparison:v26 transportType:v29 navLabelType:v31 when:*(unsigned __int16 *)&v32 routeLegWhen:v53 additionalAttributes:v33];

    if (v53[0]) {
      v53[0] = 0;
    }

    long double v34 = tan(v23 * 0.00872664626 + 0.785398163);
    long double v35 = log(v34);
    v36.f64[0] = v49;
    v36.f64[1] = v35;
    __asm { FMOV            V2.2D, #0.5 }
    float64x2_t v52 = vmlaq_f64(_Q2, (float64x2_t)xmmword_1A28FCBE0, v36);
    uint64_t v17 = v50;
    artworkAndKeyForEtaLabel(&v58, v50, (uint64_t)a3, (uint64_t)&v54, (unint64_t)&v52, v48, *(void **)&a8._hasValue);
    v42 = v58;
    v58 = 0;
    if (v42)
    {
      self->_coordinate.latitude = v23;
      self->_coordinate.longitude = v49;
      self->_coordinate.double altitude = v25;
      operator new();
    }
    v43 = v57;
    if (v57 && !atomic_fetch_add(&v57->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
    }
    v44 = v56;
    if (v56 && !atomic_fetch_add(&v56->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
    v45 = v55;
    if (v55 && !atomic_fetch_add(&v55->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }
}

- (void)clearLabel
{
  [(VKLabelNavRoadLabel *)self->_etaLabel setNavFeature:0];
  etaLabel = self->_etaLabel;
  self->_etaLabel = 0;
}

- (void)dealloc
{
  [(VKLabelNavRouteEta *)self clearLabel];
  v3.receiver = self;
  v3.super_class = (Class)VKLabelNavRouteEta;
  [(VKLabelNavRouteEta *)&v3 dealloc];
}

- (unsigned)etaComparisonToMain
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_super v3 = self->_routeInfo;
  unsigned __int8 v4 = objc_msgSend((id)objc_opt_class(), "toStyleEtaComparison:", -[VKRouteInfo etaComparisionToMain](v3, "etaComparisionToMain"));

  return v4;
}

- (VKLabelNavRouteEta)initWithRouteInfo:(id)a3 routeCoord:(PolylineCoordinate)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VKLabelNavRouteEta;
  uint64_t v8 = [(VKLabelNavRouteEta *)&v12 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_routeInfo, a3);
    v9->_routeOffset = a4;
    int v10 = v9;
  }

  return v9;
}

- (BOOL)hasLabelWithAnchor
{
  BOOL v3 = [(VKLabelNavRouteEta *)self hasLabel];
  if (v3) {
    LOBYTE(v3) = *(void *)(*(void *)[(VKLabelNavRoadLabel *)self->_etaLabel label] + 160) != 0;
  }
  return v3;
}

- (BOOL)hasAnchor
{
  BOOL v3 = [(VKLabelNavRouteEta *)self hasLabel];
  if (v3) {
    LOBYTE(v3) = *(void *)(*(void *)[(VKLabelNavRoadLabel *)self->_etaLabel label] + 160) != 0;
  }
  return v3;
}

- (BOOL)hasLabel
{
  return self->_etaLabel != 0;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unsigned __int8)a3
{
  self->_orientation = a3;
}

- (Matrix<double,)worldPointForStaging
{
  v2 = [(VKLabelNavRouteEta *)self label];
  uint64_t v3 = [v2 label];
  double v4 = *(double *)(*(void *)v3 + 136);
  double v5 = *(double *)(*(void *)v3 + 144);
  double v6 = *(double *)(*(void *)v3 + 152);

  double v7 = v4;
  double v8 = v5;
  double v9 = v6;
  result._e[2] = v9;
  result._e[1] = v8;
  result._e[0] = v7;
  return result;
}

+ (unsigned)toStyleNavLabelType:(int64_t)a3
{
  unsigned __int8 v3 = a3 + 4;
  if ((unint64_t)a3 >= 5) {
    return 4;
  }
  return v3;
}

+ (unsigned)toStyleEtaComparison:(unsigned __int8)a3
{
  if (a3 >= 4u) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (RoadSignStyleGroup)styleForNavContext:(SEL)a3 selected:(const NavContext *)a4 focused:(BOOL)a5 etaComparison:(BOOL)a6 transportType:(unsigned __int8)a7 navLabelType:(unsigned __int8)a8 when:(unsigned __int8)a9 routeLegWhen:(optional<gss:(optional<gss:(id)a12 :RouteLegWhen>)a11 :When>)a10 additionalAttributes:
{
  uint64_t v12 = a9;
  uint64_t v13 = a8;
  uint64_t v14 = a7;
  BOOL v15 = a6;
  BOOL v16 = a5;
  id v19 = *(id *)&a11._value.type;
  v80 = 0;
  v81 = 0;
  v78 = 0;
  v79 = 0;
  v76 = 0;
  v77 = 0;
  id v20 = objc_alloc_init(MEMORY[0x1E4F645A0]);
  v71[0] = 0;
  if (**(unsigned char **)&a11._hasValue)
  {
    v71[1] = *(unsigned char *)(*(void *)&a11._hasValue + 1);
    v71[0] = 1;
  }
  +[VKLabelNavRouteEta baseAttributesForEtaLabel:v16 focused:v15 etaComparison:v14 transportType:v13 navLabelType:v12 when:*(unsigned __int16 *)&a10 routeLegWhen:v71 additionalAttributes:v19];
  if (v71[0]) {
    v71[0] = 0;
  }
  objc_msgSend(v20, "replaceAttributes:count:");
  md::NavContext::styleQueryForFeatureAttributes((md::NavContext *)&v69, (GEOFeatureStyleAttributes *)a4, v20);
  double v22 = v69;
  double v21 = v70;
  v78 = v69;
  v79 = v70;
  double v23 = v73;
  if (!v19)
  {
    double v25 = 0;
    uint64_t v26 = 0;
    goto LABEL_35;
  }
  if ((unint64_t)v73 >= v74)
  {
    uint64_t v27 = (v73 - v72) >> 3;
    unint64_t v28 = v27 + 1;
    if ((unint64_t)(v27 + 1) >> 61) {
      abort();
    }
    uint64_t v29 = v74 - (void)v72;
    if ((uint64_t)(v74 - (void)v72) >> 2 > v28) {
      unint64_t v28 = v29 >> 2;
    }
    if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8) {
      uint64_t v30 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v30 = v28;
    }
    if (v30)
    {
      uint64_t v31 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v75 + 16))(v75, 8 * v30, 4);
      optional<gss::When> v32 = (char *)(v31 + 8 * v27);
      uint64_t v33 = v31 + 8 * v30;
      if (v31) {
        *(void *)optional<gss::When> v32 = 0x10001004CLL;
      }
    }
    else
    {
      uint64_t v33 = 0;
      optional<gss::When> v32 = (char *)(8 * v27);
    }
    double v24 = v32 + 8;
    long double v35 = v72;
    long double v34 = v73;
    if (v73 == v72) {
      goto LABEL_32;
    }
    unint64_t v36 = v73 - v72 - 8;
    if (v36 < 0x38)
    {
      uint64_t v38 = v73;
    }
    else if ((unint64_t)(v73 - v32) < 0x20)
    {
      uint64_t v38 = v73;
    }
    else
    {
      uint64_t v37 = (v36 >> 3) + 1;
      uint64_t v38 = &v73[-8 * (v37 & 0x3FFFFFFFFFFFFFFCLL)];
      char v39 = v32 - 16;
      unsigned int v40 = v73 - 16;
      uint64_t v41 = v37 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v42 = *(_OWORD *)v40;
        *((_OWORD *)v39 - 1) = *((_OWORD *)v40 - 1);
        *(_OWORD *)char v39 = v42;
        v39 -= 32;
        v40 -= 32;
        v41 -= 4;
      }
      while (v41);
      v32 -= 8 * (v37 & 0x3FFFFFFFFFFFFFFCLL);
      if (v37 == (v37 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_31;
      }
    }
    do
    {
      uint64_t v43 = *((void *)v38 - 1);
      v38 -= 8;
      *((void *)v32 - 1) = v43;
      v32 -= 8;
    }
    while (v38 != v35);
LABEL_31:
    long double v34 = v72;
LABEL_32:
    v72 = v32;
    v73 = v24;
    unint64_t v44 = v74;
    unint64_t v74 = v33;
    if (v34) {
      (*(void (**)(uint64_t, char *, unint64_t))(*(void *)v75 + 40))(v75, v34, v44 - (void)v34);
    }
    goto LABEL_34;
  }
  if (v73) {
    *(void *)v73 = 0x10001004CLL;
  }
  double v24 = v23 + 8;
LABEL_34:
  v73 = v24;
  objc_msgSend(v20, "replaceAttributes:count:");
  md::NavContext::styleQueryForFeatureAttributes((md::NavContext *)&v69, (GEOFeatureStyleAttributes *)a4, v20);
  uint64_t v26 = v69;
  double v25 = v70;
  v80 = v69;
  v81 = v70;
  double v23 = v73 - 8;
  v73 -= 8;
LABEL_35:
  if ((unint64_t)v23 < v74)
  {
    if (v23) {
      *(void *)double v23 = 0x30001004CLL;
    }
    v45 = v23 + 8;
    goto LABEL_62;
  }
  uint64_t v46 = (v23 - v72) >> 3;
  unint64_t v47 = v46 + 1;
  if ((unint64_t)(v46 + 1) >> 61) {
    abort();
  }
  uint64_t v48 = v74 - (void)v72;
  if ((uint64_t)(v74 - (void)v72) >> 2 > v47) {
    unint64_t v47 = v48 >> 2;
  }
  if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF8) {
    uint64_t v49 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v49 = v47;
  }
  if (v49)
  {
    uint64_t v50 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v75 + 16))(v75, 8 * v49, 4);
    v51 = (char *)(v50 + 8 * v46);
    uint64_t v52 = v50 + 8 * v49;
    if (v50) {
      *(void *)v51 = 0x30001004CLL;
    }
  }
  else
  {
    uint64_t v52 = 0;
    v51 = (char *)(8 * v46);
  }
  v45 = v51 + 8;
  uint64_t v54 = v72;
  v53 = v73;
  if (v73 != v72)
  {
    unint64_t v55 = v73 - v72 - 8;
    if (v55 < 0x38)
    {
      v57 = v73;
    }
    else if ((unint64_t)(v73 - v51) < 0x20)
    {
      v57 = v73;
    }
    else
    {
      uint64_t v56 = (v55 >> 3) + 1;
      v57 = &v73[-8 * (v56 & 0x3FFFFFFFFFFFFFFCLL)];
      v58 = v51 - 16;
      v59 = v73 - 16;
      uint64_t v60 = v56 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v61 = *(_OWORD *)v59;
        *((_OWORD *)v58 - 1) = *((_OWORD *)v59 - 1);
        *(_OWORD *)v58 = v61;
        v58 -= 32;
        v59 -= 32;
        v60 -= 4;
      }
      while (v60);
      v51 -= 8 * (v56 & 0x3FFFFFFFFFFFFFFCLL);
      if (v56 == (v56 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_59;
      }
    }
    do
    {
      uint64_t v62 = *((void *)v57 - 1);
      v57 -= 8;
      *((void *)v51 - 1) = v62;
      v51 -= 8;
    }
    while (v57 != v54);
LABEL_59:
    v53 = v72;
  }
  v72 = v51;
  v73 = v45;
  unint64_t v63 = v74;
  unint64_t v74 = v52;
  if (v53) {
    (*(void (**)(uint64_t, char *, unint64_t))(*(void *)v75 + 40))(v75, v53, v63 - (void)v53);
  }
LABEL_62:
  v73 = v45;
  objc_msgSend(v20, "replaceAttributes:count:");
  md::NavContext::styleQueryForFeatureAttributes((md::NavContext *)&v69, (GEOFeatureStyleAttributes *)a4, v20);
  v64 = v69;
  v65 = v70;
  v76 = v69;
  v77 = v70;
  retstr->var0.var0 = v22;
  retstr->var0.var1 = (__shared_weak_count *)v21;
  if (v21) {
    atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  retstr->var1.var0 = v26;
  retstr->var1.var1 = (__shared_weak_count *)v25;
  if (v25) {
    atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  retstr->var2.var0 = v64;
  retstr->var2.var1 = (__shared_weak_count *)v65;
  if (v65) {
    atomic_fetch_add_explicit(&v65->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v72)
  {
    v73 = v72;
    (*(void (**)(uint64_t, char *, unint64_t))(*(void *)v75 + 40))(v75, v72, v74 - (void)v72);
  }

  if (v65 && !atomic_fetch_add(&v65->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
    std::__shared_weak_count::__release_weak(v65);
  }
  v66 = v79;
  if (v79 && !atomic_fetch_add(&v79->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
    std::__shared_weak_count::__release_weak(v66);
  }
  v67 = v81;
  if (v81 && !atomic_fetch_add(&v81->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
    std::__shared_weak_count::__release_weak(v67);
  }

  return result;
}

+ (vector<GeoCodecsFeatureStylePair,)baseAttributesForEtaLabel:(mdm:(id)a2 :(SEL)a3 Allocator>> *__return_ptr)retstr focused:(BOOL)a4 etaComparison:(BOOL)a5 transportType:(unsigned __int8)a6 navLabelType:(unsigned __int8)a7 when:(unsigned __int8)a8 routeLegWhen:(optional<gss:(optional<gss:(id)a11 :RouteLegWhen>)a10 :When>)a9 additionalAttributes:
{
  uint64_t v12 = a8;
  uint64_t v209 = a7;
  uint64_t v13 = a6;
  BOOL v14 = a5;
  BOOL v15 = a4;
  id v210 = *(id *)&a10._value.type;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  {
    operator new();
  }
  uint64_t v17 = mdm::Allocator::instance(void)::alloc;
  retstr->var2.var1.var0 = (Allocator *)mdm::Allocator::instance(void)::alloc;
  var1 = retstr->var1;
  var0 = retstr->var2.var0;
  if (var1 < var0)
  {
    if (var1) {
      GeoCodecsFeatureStylePair *var1 = (GeoCodecsFeatureStylePair)0x1000000005;
    }
    id v20 = var1 + 1;
    goto LABEL_29;
  }
  uint64_t v21 = var1 - retstr->var0;
  unint64_t v22 = v21 + 1;
  if ((unint64_t)(v21 + 1) >> 61) {
    abort();
  }
  uint64_t v23 = (char *)var0 - (char *)retstr->var0;
  if (v23 >> 2 > v22) {
    unint64_t v22 = v23 >> 2;
  }
  if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF8) {
    uint64_t v24 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v24 = v22;
  }
  if (v24)
  {
    uint64_t v25 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v17 + 16))(v17, 8 * v24, 4);
    uint64_t v26 = (GeoCodecsFeatureStylePair *)(v25 + 8 * v21);
    uint64_t v27 = (GeoCodecsFeatureStylePair *)(v25 + 8 * v24);
    if (v25) {
      GeoCodecsFeatureStylePair *v26 = (GeoCodecsFeatureStylePair)0x1000000005;
    }
  }
  else
  {
    uint64_t v27 = 0;
    uint64_t v26 = (GeoCodecsFeatureStylePair *)(8 * v21);
  }
  id v20 = v26 + 1;
  uint64_t v29 = retstr->var0;
  unint64_t v28 = retstr->var1;
  if (v28 != retstr->var0)
  {
    unint64_t v30 = (char *)v28 - (char *)retstr->var0 - 8;
    if (v30 < 0x38)
    {
      optional<gss::When> v32 = retstr->var1;
    }
    else if ((unint64_t)((char *)v28 - (char *)v26) < 0x20)
    {
      optional<gss::When> v32 = retstr->var1;
    }
    else
    {
      uint64_t v31 = (v30 >> 3) + 1;
      optional<gss::When> v32 = &v28[-(v31 & 0x3FFFFFFFFFFFFFFCLL)];
      uint64_t v33 = v26 - 2;
      long double v34 = v28 - 2;
      uint64_t v35 = v31 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v36 = *(_OWORD *)&v34->var0;
        *(_OWORD *)&v33[-2].var0 = *(_OWORD *)&v34[-2].var0;
        *(_OWORD *)&v33->var0 = v36;
        v33 -= 4;
        v34 -= 4;
        v35 -= 4;
      }
      while (v35);
      v26 -= v31 & 0x3FFFFFFFFFFFFFFCLL;
      if (v31 == (v31 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_26;
      }
    }
    do
    {
      GeoCodecsFeatureStylePair v37 = v32[-1];
      --v32;
      v26[-1] = v37;
      --v26;
    }
    while (v32 != v29);
LABEL_26:
    unint64_t v28 = retstr->var0;
  }
  retstr->var0 = v26;
  retstr->var1 = v20;
  uint64_t v38 = retstr->var2.var0;
  retstr->var2.var0 = v27;
  if (v28) {
    (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(void *)retstr->var2.var1.var0
  }
                                                                                     + 40))(retstr->var2.var1.var0, v28, (char *)v38 - (char *)v28);
LABEL_29:
  retstr->var1 = v20;
  char v39 = retstr->var2.var0;
  if (v20 < v39)
  {
    GeoCodecsFeatureStylePair *v20 = (GeoCodecsFeatureStylePair)(((v12 << 32) | 0x10002) + 51);
    unsigned int v40 = v20 + 1;
    goto LABEL_54;
  }
  uint64_t v41 = v20 - retstr->var0;
  if ((unint64_t)(v41 + 1) >> 61) {
    abort();
  }
  uint64_t v42 = (char *)v39 - (char *)retstr->var0;
  uint64_t v43 = v42 >> 2;
  if (v42 >> 2 <= (unint64_t)(v41 + 1)) {
    uint64_t v43 = v41 + 1;
  }
  if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFF8) {
    uint64_t v44 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v44 = v43;
  }
  if (v44)
  {
    uint64_t v45 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(void *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v44, 4);
    uint64_t v46 = (GeoCodecsFeatureStylePair *)(v45 + 8 * v41);
    unint64_t v47 = (GeoCodecsFeatureStylePair *)(v45 + 8 * v44);
    if (v45) {
      *uint64_t v46 = (GeoCodecsFeatureStylePair)(((v12 << 32) | 0x10002) + 51);
    }
  }
  else
  {
    unint64_t v47 = 0;
    uint64_t v46 = (GeoCodecsFeatureStylePair *)(8 * v41);
  }
  unsigned int v40 = v46 + 1;
  uint64_t v49 = retstr->var0;
  uint64_t v48 = retstr->var1;
  if (v48 != retstr->var0)
  {
    unint64_t v50 = (char *)v48 - (char *)retstr->var0 - 8;
    if (v50 < 0x38)
    {
      uint64_t v52 = retstr->var1;
    }
    else if ((unint64_t)((char *)v48 - (char *)v46) < 0x20)
    {
      uint64_t v52 = retstr->var1;
    }
    else
    {
      uint64_t v51 = (v50 >> 3) + 1;
      uint64_t v52 = &v48[-(v51 & 0x3FFFFFFFFFFFFFFCLL)];
      v53 = v46 - 2;
      uint64_t v54 = v48 - 2;
      uint64_t v55 = v51 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v56 = *(_OWORD *)&v54->var0;
        *(_OWORD *)&v53[-2].var0 = *(_OWORD *)&v54[-2].var0;
        *(_OWORD *)&v53->var0 = v56;
        v53 -= 4;
        v54 -= 4;
        v55 -= 4;
      }
      while (v55);
      v46 -= v51 & 0x3FFFFFFFFFFFFFFCLL;
      if (v51 == (v51 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_51;
      }
    }
    do
    {
      GeoCodecsFeatureStylePair v57 = v52[-1];
      --v52;
      v46[-1] = v57;
      --v46;
    }
    while (v52 != v49);
LABEL_51:
    uint64_t v48 = retstr->var0;
  }
  retstr->var0 = v46;
  retstr->var1 = v40;
  v58 = retstr->var2.var0;
  retstr->var2.var0 = v47;
  if (v48) {
    (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(void *)retstr->var2.var1.var0
  }
                                                                                     + 40))(retstr->var2.var1.var0, v48, (char *)v58 - (char *)v48);
LABEL_54:
  retstr->var1 = v40;
  v59 = retstr->var2.var0;
  if (v40 < v59)
  {
    if (v15) {
      uint64_t v60 = 0x100010002;
    }
    else {
      uint64_t v60 = 65538;
    }
    *unsigned int v40 = (GeoCodecsFeatureStylePair)v60;
    long long v61 = v40 + 1;
    goto LABEL_85;
  }
  uint64_t v62 = v40 - retstr->var0;
  if ((unint64_t)(v62 + 1) >> 61) {
    abort();
  }
  uint64_t v63 = (char *)v59 - (char *)retstr->var0;
  uint64_t v64 = v63 >> 2;
  if (v63 >> 2 <= (unint64_t)(v62 + 1)) {
    uint64_t v64 = v62 + 1;
  }
  if ((unint64_t)v63 >= 0x7FFFFFFFFFFFFFF8) {
    uint64_t v65 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v65 = v64;
  }
  if (v65)
  {
    uint64_t v66 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(void *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v65, 4);
    v67 = (GeoCodecsFeatureStylePair *)(v66 + 8 * v62);
    v68 = (GeoCodecsFeatureStylePair *)(v66 + 8 * v65);
    if (v66)
    {
      if (v15) {
        uint64_t v69 = 0x100010002;
      }
      else {
        uint64_t v69 = 65538;
      }
      GeoCodecsFeatureStylePair *v67 = (GeoCodecsFeatureStylePair)v69;
    }
  }
  else
  {
    v68 = 0;
    v67 = (GeoCodecsFeatureStylePair *)(8 * v62);
  }
  long long v61 = v67 + 1;
  v71 = retstr->var0;
  v70 = retstr->var1;
  if (v70 != retstr->var0)
  {
    unint64_t v72 = (char *)v70 - (char *)retstr->var0 - 8;
    if (v72 < 0x38)
    {
      unint64_t v74 = retstr->var1;
    }
    else if ((unint64_t)((char *)v70 - (char *)v67) < 0x20)
    {
      unint64_t v74 = retstr->var1;
    }
    else
    {
      uint64_t v73 = (v72 >> 3) + 1;
      unint64_t v74 = &v70[-(v73 & 0x3FFFFFFFFFFFFFFCLL)];
      uint64_t v75 = v67 - 2;
      v76 = v70 - 2;
      uint64_t v77 = v73 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v78 = *(_OWORD *)&v76->var0;
        *(_OWORD *)&v75[-2].var0 = *(_OWORD *)&v76[-2].var0;
        *(_OWORD *)&v75->var0 = v78;
        v75 -= 4;
        v76 -= 4;
        v77 -= 4;
      }
      while (v77);
      v67 -= v73 & 0x3FFFFFFFFFFFFFFCLL;
      if (v73 == (v73 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_82;
      }
    }
    do
    {
      GeoCodecsFeatureStylePair v79 = v74[-1];
      --v74;
      v67[-1] = v79;
      --v67;
    }
    while (v74 != v71);
LABEL_82:
    v70 = retstr->var0;
  }
  retstr->var0 = v67;
  retstr->var1 = v61;
  v80 = retstr->var2.var0;
  retstr->var2.var0 = v68;
  if (v70) {
    (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(void *)retstr->var2.var1.var0
  }
                                                                                     + 40))(retstr->var2.var1.var0, v70, (char *)v80 - (char *)v70);
LABEL_85:
  retstr->var1 = v61;
  v81 = retstr->var2.var0;
  if (v61 < v81)
  {
    if (v14) {
      uint64_t v82 = 0x100010002;
    }
    else {
      uint64_t v82 = 65538;
    }
    *long long v61 = (GeoCodecsFeatureStylePair)(v82 + 75);
    v83 = v61 + 1;
    goto LABEL_116;
  }
  uint64_t v84 = v61 - retstr->var0;
  if ((unint64_t)(v84 + 1) >> 61) {
    abort();
  }
  uint64_t v85 = (char *)v81 - (char *)retstr->var0;
  uint64_t v86 = v85 >> 2;
  if (v85 >> 2 <= (unint64_t)(v84 + 1)) {
    uint64_t v86 = v84 + 1;
  }
  if ((unint64_t)v85 >= 0x7FFFFFFFFFFFFFF8) {
    uint64_t v87 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v87 = v86;
  }
  if (v87)
  {
    uint64_t v88 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(void *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v87, 4);
    v89 = (GeoCodecsFeatureStylePair *)(v88 + 8 * v84);
    v90 = (GeoCodecsFeatureStylePair *)(v88 + 8 * v87);
    if (v88)
    {
      if (v14) {
        uint64_t v91 = 0x100010002;
      }
      else {
        uint64_t v91 = 65538;
      }
      GeoCodecsFeatureStylePair *v89 = (GeoCodecsFeatureStylePair)(v91 + 75);
    }
  }
  else
  {
    v90 = 0;
    v89 = (GeoCodecsFeatureStylePair *)(8 * v84);
  }
  v83 = v89 + 1;
  v93 = retstr->var0;
  v92 = retstr->var1;
  if (v92 != retstr->var0)
  {
    unint64_t v94 = (char *)v92 - (char *)retstr->var0 - 8;
    if (v94 < 0x38)
    {
      v96 = retstr->var1;
    }
    else if ((unint64_t)((char *)v92 - (char *)v89) < 0x20)
    {
      v96 = retstr->var1;
    }
    else
    {
      uint64_t v95 = (v94 >> 3) + 1;
      v96 = &v92[-(v95 & 0x3FFFFFFFFFFFFFFCLL)];
      v97 = v89 - 2;
      v98 = v92 - 2;
      uint64_t v99 = v95 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v100 = *(_OWORD *)&v98->var0;
        *(_OWORD *)&v97[-2].var0 = *(_OWORD *)&v98[-2].var0;
        *(_OWORD *)&v97->var0 = v100;
        v97 -= 4;
        v98 -= 4;
        v99 -= 4;
      }
      while (v99);
      v89 -= v95 & 0x3FFFFFFFFFFFFFFCLL;
      if (v95 == (v95 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_113;
      }
    }
    do
    {
      GeoCodecsFeatureStylePair v101 = v96[-1];
      --v96;
      v89[-1] = v101;
      --v89;
    }
    while (v96 != v93);
LABEL_113:
    v92 = retstr->var0;
  }
  retstr->var0 = v89;
  retstr->var1 = v83;
  v102 = retstr->var2.var0;
  retstr->var2.var0 = v90;
  if (v92) {
    (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(void *)retstr->var2.var1.var0
  }
                                                                                     + 40))(retstr->var2.var1.var0, v92, (char *)v102 - (char *)v92);
LABEL_116:
  retstr->var1 = v83;
  v103 = retstr->var2.var0;
  if (v83 < v103)
  {
    GeoCodecsFeatureStylePair *v83 = (GeoCodecsFeatureStylePair)(((v13 << 32) | 0x10002) + 69);
    v104 = v83 + 1;
    goto LABEL_141;
  }
  uint64_t v105 = v83 - retstr->var0;
  if ((unint64_t)(v105 + 1) >> 61) {
    abort();
  }
  uint64_t v106 = (char *)v103 - (char *)retstr->var0;
  uint64_t v107 = v106 >> 2;
  if (v106 >> 2 <= (unint64_t)(v105 + 1)) {
    uint64_t v107 = v105 + 1;
  }
  if ((unint64_t)v106 >= 0x7FFFFFFFFFFFFFF8) {
    uint64_t v108 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v108 = v107;
  }
  if (v108)
  {
    uint64_t v109 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(void *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v108, 4);
    v110 = (GeoCodecsFeatureStylePair *)(v109 + 8 * v105);
    v111 = (GeoCodecsFeatureStylePair *)(v109 + 8 * v108);
    if (v109) {
      GeoCodecsFeatureStylePair *v110 = (GeoCodecsFeatureStylePair)(((v13 << 32) | 0x10002) + 69);
    }
  }
  else
  {
    v111 = 0;
    v110 = (GeoCodecsFeatureStylePair *)(8 * v105);
  }
  v104 = v110 + 1;
  v113 = retstr->var0;
  v112 = retstr->var1;
  if (v112 != retstr->var0)
  {
    unint64_t v114 = (char *)v112 - (char *)retstr->var0 - 8;
    if (v114 < 0x38)
    {
      v116 = retstr->var1;
    }
    else if ((unint64_t)((char *)v112 - (char *)v110) < 0x20)
    {
      v116 = retstr->var1;
    }
    else
    {
      uint64_t v115 = (v114 >> 3) + 1;
      v116 = &v112[-(v115 & 0x3FFFFFFFFFFFFFFCLL)];
      v117 = v110 - 2;
      v118 = v112 - 2;
      uint64_t v119 = v115 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v120 = *(_OWORD *)&v118->var0;
        *(_OWORD *)&v117[-2].var0 = *(_OWORD *)&v118[-2].var0;
        *(_OWORD *)&v117->var0 = v120;
        v117 -= 4;
        v118 -= 4;
        v119 -= 4;
      }
      while (v119);
      v110 -= v115 & 0x3FFFFFFFFFFFFFFCLL;
      if (v115 == (v115 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_138;
      }
    }
    do
    {
      GeoCodecsFeatureStylePair v121 = v116[-1];
      --v116;
      v110[-1] = v121;
      --v110;
    }
    while (v116 != v113);
LABEL_138:
    v112 = retstr->var0;
  }
  retstr->var0 = v110;
  retstr->var1 = v104;
  v122 = retstr->var2.var0;
  retstr->var2.var0 = v111;
  if (v112) {
    (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(void *)retstr->var2.var1.var0
  }
                                                                                     + 40))(retstr->var2.var1.var0, v112, (char *)v122 - (char *)v112);
LABEL_141:
  retstr->var1 = v104;
  v123 = retstr->var2.var0;
  if (v104 < v123)
  {
    GeoCodecsFeatureStylePair *v104 = (GeoCodecsFeatureStylePair)(((v209 << 32) | 0x10002) + 14);
    v124 = v104 + 1;
    goto LABEL_166;
  }
  uint64_t v125 = v104 - retstr->var0;
  if ((unint64_t)(v125 + 1) >> 61) {
    abort();
  }
  uint64_t v126 = (char *)v123 - (char *)retstr->var0;
  uint64_t v127 = v126 >> 2;
  if (v126 >> 2 <= (unint64_t)(v125 + 1)) {
    uint64_t v127 = v125 + 1;
  }
  if ((unint64_t)v126 >= 0x7FFFFFFFFFFFFFF8) {
    uint64_t v128 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v128 = v127;
  }
  if (v128)
  {
    uint64_t v129 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(void *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v128, 4);
    v130 = (GeoCodecsFeatureStylePair *)(v129 + 8 * v125);
    v131 = (GeoCodecsFeatureStylePair *)(v129 + 8 * v128);
    if (v129) {
      GeoCodecsFeatureStylePair *v130 = (GeoCodecsFeatureStylePair)(((v209 << 32) | 0x10002) + 14);
    }
  }
  else
  {
    v131 = 0;
    v130 = (GeoCodecsFeatureStylePair *)(8 * v125);
  }
  v124 = v130 + 1;
  v133 = retstr->var0;
  v132 = retstr->var1;
  if (v132 != retstr->var0)
  {
    unint64_t v134 = (char *)v132 - (char *)retstr->var0 - 8;
    if (v134 < 0x38)
    {
      v136 = retstr->var1;
    }
    else if ((unint64_t)((char *)v132 - (char *)v130) < 0x20)
    {
      v136 = retstr->var1;
    }
    else
    {
      uint64_t v135 = (v134 >> 3) + 1;
      v136 = &v132[-(v135 & 0x3FFFFFFFFFFFFFFCLL)];
      v137 = v130 - 2;
      v138 = v132 - 2;
      uint64_t v139 = v135 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v140 = *(_OWORD *)&v138->var0;
        *(_OWORD *)&v137[-2].var0 = *(_OWORD *)&v138[-2].var0;
        *(_OWORD *)&v137->var0 = v140;
        v137 -= 4;
        v138 -= 4;
        v139 -= 4;
      }
      while (v139);
      v130 -= v135 & 0x3FFFFFFFFFFFFFFCLL;
      if (v135 == (v135 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_163;
      }
    }
    do
    {
      GeoCodecsFeatureStylePair v141 = v136[-1];
      --v136;
      v130[-1] = v141;
      --v130;
    }
    while (v136 != v133);
LABEL_163:
    v132 = retstr->var0;
  }
  retstr->var0 = v130;
  retstr->var1 = v124;
  v142 = retstr->var2.var0;
  retstr->var2.var0 = v131;
  if (v132) {
    (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(void *)retstr->var2.var1.var0
  }
                                                                                     + 40))(retstr->var2.var1.var0, v132, (char *)v142 - (char *)v132);
LABEL_166:
  retstr->var1 = v124;
  if ((*(_WORD *)&a9 & 0xFF00) == 0) {
    goto LABEL_193;
  }
  v143 = retstr->var2.var0;
  if (v124 >= v143)
  {
    uint64_t v144 = v124 - retstr->var0;
    if ((unint64_t)(v144 + 1) >> 61) {
      abort();
    }
    uint64_t v145 = (char *)v143 - (char *)retstr->var0;
    uint64_t v146 = v145 >> 2;
    if (v145 >> 2 <= (unint64_t)(v144 + 1)) {
      uint64_t v146 = v144 + 1;
    }
    if ((unint64_t)v145 >= 0x7FFFFFFFFFFFFFF8) {
      uint64_t v147 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v147 = v146;
    }
    if (v147)
    {
      uint64_t v148 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(void *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v147, 4);
      v149 = (GeoCodecsFeatureStylePair *)(v148 + 8 * v144);
      v150 = (GeoCodecsFeatureStylePair *)(v148 + 8 * v147);
      if (v148) {
        GeoCodecsFeatureStylePair *v149 = (GeoCodecsFeatureStylePair)((((unint64_t)a9.var0.__val_ << 32) | 0x10002) + 7);
      }
    }
    else
    {
      v150 = 0;
      v149 = (GeoCodecsFeatureStylePair *)(8 * v144);
    }
    v124 = v149 + 1;
    v152 = retstr->var0;
    v151 = retstr->var1;
    if (v151 == retstr->var0) {
      goto LABEL_190;
    }
    unint64_t v153 = (char *)v151 - (char *)retstr->var0 - 8;
    if (v153 < 0x38)
    {
      v155 = retstr->var1;
    }
    else if ((unint64_t)((char *)v151 - (char *)v149) < 0x20)
    {
      v155 = retstr->var1;
    }
    else
    {
      uint64_t v154 = (v153 >> 3) + 1;
      v155 = &v151[-(v154 & 0x3FFFFFFFFFFFFFFCLL)];
      v156 = v149 - 2;
      v157 = v151 - 2;
      uint64_t v158 = v154 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v159 = *(_OWORD *)&v157->var0;
        *(_OWORD *)&v156[-2].var0 = *(_OWORD *)&v157[-2].var0;
        *(_OWORD *)&v156->var0 = v159;
        v156 -= 4;
        v157 -= 4;
        v158 -= 4;
      }
      while (v158);
      v149 -= v154 & 0x3FFFFFFFFFFFFFFCLL;
      if (v154 == (v154 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_189;
      }
    }
    do
    {
      GeoCodecsFeatureStylePair v160 = v155[-1];
      --v155;
      v149[-1] = v160;
      --v149;
    }
    while (v155 != v152);
LABEL_189:
    v151 = retstr->var0;
LABEL_190:
    retstr->var0 = v149;
    retstr->var1 = v124;
    v161 = retstr->var2.var0;
    retstr->var2.var0 = v150;
    if (v151) {
      (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(void *)retstr->var2.var1.var0
    }
                                                                                       + 40))(retstr->var2.var1.var0, v151, (char *)v161 - (char *)v151);
    goto LABEL_192;
  }
  *v124++ = (GeoCodecsFeatureStylePair)((((unint64_t)a9.var0.__val_ << 32) | 0x10002) + 7);
LABEL_192:
  retstr->var1 = v124;
LABEL_193:
  if (!**(unsigned char **)&a10._hasValue) {
    goto LABEL_220;
  }
  uint64_t v162 = *(unsigned __int8 *)(*(void *)&a10._hasValue + 1);
  v163 = retstr->var2.var0;
  if (v124 >= v163)
  {
    uint64_t v165 = v124 - retstr->var0;
    if ((unint64_t)(v165 + 1) >> 61) {
      abort();
    }
    uint64_t v166 = (char *)v163 - (char *)retstr->var0;
    uint64_t v167 = v166 >> 2;
    if (v166 >> 2 <= (unint64_t)(v165 + 1)) {
      uint64_t v167 = v165 + 1;
    }
    if ((unint64_t)v166 >= 0x7FFFFFFFFFFFFFF8) {
      uint64_t v168 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v168 = v167;
    }
    if (v168)
    {
      uint64_t v169 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(void *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v168, 4);
      v170 = (GeoCodecsFeatureStylePair *)(v169 + 8 * v165);
      v171 = (GeoCodecsFeatureStylePair *)(v169 + 8 * v168);
      if (v169) {
        GeoCodecsFeatureStylePair *v170 = (GeoCodecsFeatureStylePair)(((v162 << 32) | 0x10002) + 82);
      }
    }
    else
    {
      v171 = 0;
      v170 = (GeoCodecsFeatureStylePair *)(8 * v165);
    }
    v164 = v170 + 1;
    v173 = retstr->var0;
    v172 = retstr->var1;
    if (v172 == retstr->var0) {
      goto LABEL_217;
    }
    unint64_t v174 = (char *)v172 - (char *)retstr->var0 - 8;
    if (v174 < 0x38)
    {
      v176 = retstr->var1;
    }
    else if ((unint64_t)((char *)v172 - (char *)v170) < 0x20)
    {
      v176 = retstr->var1;
    }
    else
    {
      uint64_t v175 = (v174 >> 3) + 1;
      v176 = &v172[-(v175 & 0x3FFFFFFFFFFFFFFCLL)];
      v177 = v170 - 2;
      v178 = v172 - 2;
      uint64_t v179 = v175 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v180 = *(_OWORD *)&v178->var0;
        *(_OWORD *)&v177[-2].var0 = *(_OWORD *)&v178[-2].var0;
        *(_OWORD *)&v177->var0 = v180;
        v177 -= 4;
        v178 -= 4;
        v179 -= 4;
      }
      while (v179);
      v170 -= v175 & 0x3FFFFFFFFFFFFFFCLL;
      if (v175 == (v175 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_216;
      }
    }
    do
    {
      GeoCodecsFeatureStylePair v181 = v176[-1];
      --v176;
      v170[-1] = v181;
      --v170;
    }
    while (v176 != v173);
LABEL_216:
    v172 = retstr->var0;
LABEL_217:
    retstr->var0 = v170;
    retstr->var1 = v164;
    v182 = retstr->var2.var0;
    retstr->var2.var0 = v171;
    if (v172) {
      (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(void *)retstr->var2.var1.var0
    }
                                                                                       + 40))(retstr->var2.var1.var0, v172, (char *)v182 - (char *)v172);
    goto LABEL_219;
  }
  GeoCodecsFeatureStylePair *v124 = (GeoCodecsFeatureStylePair)(((v162 << 32) | 0x10002) + 82);
  v164 = v124 + 1;
LABEL_219:
  retstr->var1 = v164;
LABEL_220:
  if (v210)
  {
    for (unint64_t i = 0; i < objc_msgSend(v210, "countAttrs", v209); ++i)
    {
      uint64_t v185 = [v210 v];
      uint64_t v186 = v185;
      v187 = retstr->var1;
      v188 = retstr->var2.var0;
      if (v187 < v188)
      {
        if (v187) {
          GeoCodecsFeatureStylePair *v187 = *(GeoCodecsFeatureStylePair *)(v185 + 8 * i);
        }
        v184 = v187 + 1;
        goto LABEL_223;
      }
      uint64_t v189 = v187 - retstr->var0;
      unint64_t v190 = v189 + 1;
      if ((unint64_t)(v189 + 1) >> 61) {
        abort();
      }
      uint64_t v191 = (char *)v188 - (char *)retstr->var0;
      if (v191 >> 2 > v190) {
        unint64_t v190 = v191 >> 2;
      }
      if ((unint64_t)v191 >= 0x7FFFFFFFFFFFFFF8) {
        uint64_t v192 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v192 = v190;
      }
      if (v192)
      {
        uint64_t v193 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(void *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v192, 4);
        uint64_t v194 = v193 + 8 * v189;
        v195 = (GeoCodecsFeatureStylePair *)(v193 + 8 * v192);
        if (v193) {
          *(void *)uint64_t v194 = *(void *)(v186 + 8 * i);
        }
      }
      else
      {
        v195 = 0;
        uint64_t v194 = 8 * v189;
      }
      v197 = retstr->var0;
      v196 = retstr->var1;
      int64_t v198 = (char *)v196 - (char *)retstr->var0;
      if (v196 == retstr->var0)
      {
        v200 = (GeoCodecsFeatureStylePair *)v194;
        goto LABEL_249;
      }
      unint64_t v199 = v198 - 8;
      if ((unint64_t)(v198 - 8) < 0x38)
      {
        v200 = (GeoCodecsFeatureStylePair *)v194;
      }
      else
      {
        v200 = (GeoCodecsFeatureStylePair *)v194;
        if ((unint64_t)v196 - v194 >= 0x20)
        {
          uint64_t v201 = (v199 >> 3) + 1;
          v202 = (_OWORD *)(v194 - 16);
          v203 = v196 - 2;
          uint64_t v204 = v201 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v205 = *(_OWORD *)&v203->var0;
            *(v202 - 1) = *(_OWORD *)&v203[-2].var0;
            _OWORD *v202 = v205;
            v202 -= 2;
            v203 -= 4;
            v204 -= 4;
          }
          while (v204);
          v200 = (GeoCodecsFeatureStylePair *)(v194 - 8 * (v201 & 0x3FFFFFFFFFFFFFFCLL));
          v196 -= v201 & 0x3FFFFFFFFFFFFFFCLL;
          if (v201 == (v201 & 0x3FFFFFFFFFFFFFFCLL)) {
            goto LABEL_248;
          }
        }
      }
      do
      {
        GeoCodecsFeatureStylePair v206 = v196[-1];
        --v196;
        v200[-1] = v206;
        --v200;
      }
      while (v196 != v197);
LABEL_248:
      v196 = retstr->var0;
LABEL_249:
      v184 = (GeoCodecsFeatureStylePair *)(v194 + 8);
      retstr->var0 = v200;
      retstr->var1 = (GeoCodecsFeatureStylePair *)(v194 + 8);
      v207 = retstr->var2.var0;
      retstr->var2.var0 = v195;
      if (v196) {
        (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(void *)retstr->var2.var1.var0
      }
                                                                                         + 40))(retstr->var2.var1.var0, v196, (char *)v207 - (char *)v196);
LABEL_223:
      retstr->var1 = v184;
    }
  }

  return result;
}

+ (id)artworkForEtaDescription:(id)a3 navContext:(const NavContext *)a4 roadSignStyleGroup:(const void *)a5 mercatorPoint:(const void *)a6 orientation:(unsigned __int8)a7 isSelected:(BOOL)a8 artworkCache:(void *)a9
{
  artworkAndKeyForEtaLabel((char **)&v11, a3, (uint64_t)a4, (uint64_t)a5, (unint64_t)a6, a7, a9);
  id v9 = v11;
  return v9;
}

@end