@interface BKMouseDestination
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation BKMouseDestination

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_hitTestSecurityAnalysis, 0);
  objc_storeStrong((id *)&self->_hitTestInformationAtButtonDown, 0);
  objc_storeStrong((id *)&self->_senderInfo, 0);

  objc_storeStrong((id *)&self->_displayUUID, 0);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100029758;
  v5[3] = &unk_1000F8E50;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  [v4 appendProem:0 block:v5];
}

- (id)description
{
  return +[BSDescriptionStream descriptionForRootObject:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKMouseDestination;
  id v4 = [(BKCAContextDestination *)&v6 copyWithZone:a3];
  sub_1000298B0((uint64_t)v4, self->_displayUUID);
  sub_1000298C8((uint64_t)v4, self->_senderInfo);
  if (v4) {
    v4[5] = self->_hitTestPoint;
  }
  return v4;
}

@end