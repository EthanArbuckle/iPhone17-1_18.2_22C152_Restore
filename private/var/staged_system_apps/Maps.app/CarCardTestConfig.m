@interface CarCardTestConfig
- ($B1874A4E4729613F071A632570863A63)layout;
- (BOOL)compresses;
- (BOOL)grows;
- (BOOL)stackUseCardLayout;
- (BOOL)staysOnTop;
- (CGSize)size;
- (CarCardTestConfig)initWithNotification:(id)a3;
- (id)description;
- (int64_t)stackAlignment;
- (int64_t)stackAxis;
- (unint64_t)stackCount;
@end

@implementation CarCardTestConfig

- (CarCardTestConfig)initWithNotification:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CarCardTestConfig;
  v5 = [(CarCardTestConfig *)&v31 init];
  if (v5)
  {
    v6 = [v4 userInfo];
    v7 = [v6 objectForKeyedSubscript:@"Layout"];

    v8 = [v4 userInfo];
    v9 = [v8 objectForKeyedSubscript:@"Size"];

    id v28 = 0;
    id v29 = 0;
    [v7 getValue:v27];
    uint64_t v30 = 15;
    [v9 CGSizeValue:sub_10077FA04((uint64_t)&v5->_layout, v27).n128_f64[0]];
    v5->_size.width = v10;
    v5->_size.height = v11;
    v12 = [v4 userInfo];
    v13 = [v12 objectForKeyedSubscript:@"StaysOnTop"];
    v5->_staysOnTop = [v13 BOOLValue];

    v14 = [v4 userInfo];
    v15 = [v14 objectForKeyedSubscript:@"Grows"];
    v5->_grows = [v15 BOOLValue];

    v16 = [v4 userInfo];
    v17 = [v16 objectForKeyedSubscript:@"Compresses"];
    v5->_compresses = [v17 BOOLValue];

    v18 = [v4 userInfo];
    v19 = [v18 objectForKeyedSubscript:@"StackCount"];
    v5->_stackCount = (unint64_t)[v19 unsignedIntegerValue];

    v20 = [v4 userInfo];
    v21 = [v20 objectForKeyedSubscript:@"StackUseCardLayout"];
    v5->_stackUseCardLayout = [v21 BOOLValue];

    v22 = [v4 userInfo];
    v23 = [v22 objectForKeyedSubscript:@"StackAxis"];
    v5->_stackAxis = (int64_t)[v23 integerValue];

    v24 = [v4 userInfo];
    v25 = [v24 objectForKeyedSubscript:@"StackAlignment"];
    v5->_stackAlignment = (int64_t)[v25 integerValue];
  }
  return v5;
}

- (id)description
{
  unint64_t v3 = [(CarCardTestConfig *)self stackAlignment];
  if (v3 > 5) {
    CFStringRef v4 = &stru_101324E70;
  }
  else {
    CFStringRef v4 = *(&off_101321758 + v3);
  }
  uint64_t v5 = objc_opt_class();
  [(CarCardTestConfig *)self layout];
  if ((unint64_t)(v46 - 1) > 7) {
    CFStringRef v6 = @"None";
  }
  else {
    CFStringRef v6 = *(&off_101321788 + v46 - 1);
  }
  if ((unint64_t)(v47 - 1) > 7) {
    CFStringRef v7 = @"none";
  }
  else {
    CFStringRef v7 = *(&off_1013217C8 + v47 - 1);
  }
  if (v48) {
    v8 = @"Vertical";
  }
  else {
    v8 = @"Horizontal";
  }
  v45 = v8;
  v9 = objc_opt_new();
  CGFloat v10 = v9;
  char v11 = v49;
  if (v49)
  {
    [v9 addObject:@"Top"];
    char v11 = v49;
  }
  if ((v11 & 2) != 0)
  {
    [v10 addObject:@"Left"];
    char v11 = v49;
  }
  if ((v11 & 4) != 0)
  {
    [v10 addObject:@"Bottom"];
    char v11 = v49;
  }
  if ((v11 & 8) != 0) {
    [v10 addObject:@"Right"];
  }
  CFStringRef v44 = v7;
  v12 = [v10 componentsJoinedByString:@", "];
  v13 = +[NSString stringWithFormat:@"[%@]", v12];

  if (v50 > 3) {
    CFStringRef v14 = @".Unknown";
  }
  else {
    CFStringRef v14 = *(&off_101321808 + v50);
  }
  CFStringRef v42 = v4;
  uint64_t v41 = v5;
  if (v52 > 3) {
    CFStringRef v15 = @".Unknown";
  }
  else {
    CFStringRef v15 = *(&off_101321808 + v52);
  }
  CFStringRef v43 = v6;
  v16 = +[NSString stringWithFormat:@"(t:%.1f l:%.1f b:%.1f r:%.1f)", v56, v57, v58];
  if (v59) {
    v17 = @"YES";
  }
  else {
    v17 = @"NO";
  }
  v18 = v17;
  v19 = objc_opt_new();
  v20 = v19;
  char v21 = v60;
  if (v60)
  {
    [v19 addObject:@"Top"];
    char v21 = v60;
  }
  if ((v21 & 2) != 0)
  {
    [v20 addObject:@"Left"];
    char v21 = v60;
  }
  if ((v21 & 4) != 0)
  {
    [v20 addObject:@"Bottom"];
    char v21 = v60;
  }
  if ((v21 & 8) != 0) {
    [v20 addObject:@"Right"];
  }
  CFStringRef v22 = v14;
  v23 = [v20 componentsJoinedByString:@", "];
  v24 = +[NSString stringWithFormat:@"[%@]", v23];

  v25 = +[NSString stringWithFormat:@"<CarCardLayout edgePosition=%@ cornerPosition=%@ primaryAxis=%@ pinnedEdges=%@ primaryAxisFillMode=%@, priority:%lu, secondaryAxisFillMode=%@, priority:%lu, margins=%@ flipForRightHandDrive=%@ edgesAffectingMapInsets=%@", v43, v44, v45, v13, v22, (unint64_t)v51, v15, (unint64_t)v53, v16, v18, v24];

  [(CarCardTestConfig *)self size];
  uint64_t v27 = v26;
  [(CarCardTestConfig *)self size];
  id v29 = +[NSString stringWithFormat:@"(%.1fx %.1fy)", v27, v28];
  if ([(CarCardTestConfig *)self grows]) {
    uint64_t v30 = @"YES";
  }
  else {
    uint64_t v30 = @"NO";
  }
  objc_super v31 = v30;
  if ([(CarCardTestConfig *)self compresses]) {
    v32 = @"YES";
  }
  else {
    v32 = @"NO";
  }
  v33 = v32;
  unint64_t v34 = [(CarCardTestConfig *)self stackCount];
  if ([(CarCardTestConfig *)self stackUseCardLayout]) {
    v35 = @"YES";
  }
  else {
    v35 = @"NO";
  }
  v36 = v35;
  if ([(CarCardTestConfig *)self stackAxis]) {
    CFStringRef v37 = @"Vertical";
  }
  else {
    CFStringRef v37 = @"Horizontal";
  }
  if ([(CarCardTestConfig *)self staysOnTop]) {
    CFStringRef v38 = @"YES";
  }
  else {
    CFStringRef v38 = @"NO";
  }
  v39 = +[NSString stringWithFormat:@"<%@: %p layout=%@ size=%@ grows=%@ compresses=%@ stackCount=%lu stackUseCardLayout=%@ stackAxis=%@ stackAlignment=%@ staysOnTop=%@>", v41, self, v25, v29, v31, v33, v34, v36, v37, v42, v38];

  return v39;
}

- ($B1874A4E4729613F071A632570863A63)layout
{
  long long v5 = *(_OWORD *)&self->_layout.primaryAxis;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->_layout.edgePosition;
  *(_OWORD *)&retstr->var2 = v5;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self->_layout.primaryAxisFillMode;
  *(_OWORD *)(&retstr->var5 + 1) = *(_OWORD *)(&self->_layout.primaryAxisFillModePriority + 1);
  retstr->var8 = self->_layout.primaryAxisFillLimit;
  result = self->_layout.secondaryAxisFillLimit;
  retstr->var9 = result;
  long long v7 = *(_OWORD *)&self->_layout.margins.bottom;
  *(_OWORD *)&retstr->var10.top = *(_OWORD *)&self->_layout.margins.top;
  *(_OWORD *)&retstr->var10.bottom = v7;
  *(_OWORD *)&retstr->var11 = *(_OWORD *)&self->_layout.flipForRightHandDrive;
  retstr->var13 = self->_layout.horizontallyCenterMapInsets;
  return result;
}

- (BOOL)staysOnTop
{
  return self->_staysOnTop;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)grows
{
  return self->_grows;
}

- (BOOL)compresses
{
  return self->_compresses;
}

- (unint64_t)stackCount
{
  return self->_stackCount;
}

- (BOOL)stackUseCardLayout
{
  return self->_stackUseCardLayout;
}

- (int64_t)stackAxis
{
  return self->_stackAxis;
}

- (int64_t)stackAlignment
{
  return self->_stackAlignment;
}

- (void).cxx_destruct
{
  secondaryAxisFillLimit = self->_layout.secondaryAxisFillLimit;
}

@end