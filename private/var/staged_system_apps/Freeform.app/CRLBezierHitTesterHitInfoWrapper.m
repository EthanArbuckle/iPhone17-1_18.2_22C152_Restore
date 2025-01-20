@interface CRLBezierHitTesterHitInfoWrapper
- ($83CD26A8C5B845DF12AAFDBAEBBD4A79)hitInfo;
- (CRLBezierHitTesterHitInfoWrapper)initWithHitInfo:(id *)a3 hitPath:(id)a4;
- (CRLBezierPath)hitPath;
- (id)description;
@end

@implementation CRLBezierHitTesterHitInfoWrapper

- (CRLBezierHitTesterHitInfoWrapper)initWithHitInfo:(id *)a3 hitPath:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRLBezierHitTesterHitInfoWrapper;
  v8 = [(CRLBezierHitTesterHitInfoWrapper *)&v14 init];
  v9 = v8;
  if (v8)
  {
    CGPoint var0 = a3->var0;
    CGPoint var1 = a3->var1;
    long long v12 = *(_OWORD *)&a3->var2;
    v8->_hitInfo.distanceBetweenPoints = a3->var4;
    v8->_hitInfo.hitPoint = var1;
    *(_OWORD *)&v8->_hitInfo.hitPathID = v12;
    v8->_hitInfo.testPoint = var0;
    objc_storeStrong((id *)&v8->_hitPath, a4);
  }

  return v9;
}

- (id)description
{
  v3 = NSStringFromCGPoint(self->_hitInfo.testPoint);
  v4 = NSStringFromCGPoint(self->_hitInfo.hitPoint);
  v5 = +[NSString stringWithFormat:@"testPoint: %@ hitPoint: %@ hitPathID: %lu hitPath: %p hitPercentAlongPath:%f distanceBetweenPoints: %f", v3, v4, self->_hitInfo.hitPathID, self->_hitPath, *(void *)&self->_hitInfo.hitPercentAlongPath, *(void *)&self->_hitInfo.distanceBetweenPoints];

  return v5;
}

- ($83CD26A8C5B845DF12AAFDBAEBBD4A79)hitInfo
{
  CGPoint v3 = *(CGPoint *)&self->var2;
  retstr->CGPoint var0 = self->var1;
  retstr->CGPoint var1 = v3;
  *(_OWORD *)&retstr->var2 = *(_OWORD *)&self->var4;
  retstr->var4 = self[1].var0.y;
  return self;
}

- (CRLBezierPath)hitPath
{
  return self->_hitPath;
}

- (void).cxx_destruct
{
}

@end