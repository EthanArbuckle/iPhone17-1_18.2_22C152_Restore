@interface MRGroupComposition
+ (id)homePodHomeTheaterComposition;
+ (id)homePodMiniHomeTheaterComposition;
+ (id)homePodMiniStereoPairComposition;
+ (id)homePodStereoPairComposition;
+ (id)multiBuiltInComposition;
+ (id)unknownComposition;
- (NSString)soloModelIdentifier;
- (NSString)soloProductIdentifier;
- (id)description;
- (unint64_t)atvCount;
- (unint64_t)bluetoothSpeakerCount;
- (unint64_t)builtInCount;
- (unint64_t)carplayCount;
- (unint64_t)displayCount;
- (unint64_t)headphoneCount;
- (unint64_t)hearingDeviceCount;
- (unint64_t)hifiCount;
- (unint64_t)homePodCount;
- (unint64_t)homePodMiniCount;
- (unint64_t)iPhoneCount;
- (unint64_t)legacyBeatsCount;
- (unint64_t)lofiCount;
- (unint64_t)macCount;
- (unint64_t)setTopCount;
- (unint64_t)totalCount;
- (unint64_t)tvCount;
- (unint64_t)tvStickCount;
- (unint64_t)unknownCount;
- (unint64_t)vehicleCount;
- (unint64_t)visionCount;
- (void)setAtvCount:(unint64_t)a3;
- (void)setBluetoothSpeakerCount:(unint64_t)a3;
- (void)setBuiltInCount:(unint64_t)a3;
- (void)setCarplayCount:(unint64_t)a3;
- (void)setDisplayCount:(unint64_t)a3;
- (void)setHeadphoneCount:(unint64_t)a3;
- (void)setHearingDeviceCount:(unint64_t)a3;
- (void)setHifiCount:(unint64_t)a3;
- (void)setHomePodCount:(unint64_t)a3;
- (void)setHomePodMiniCount:(unint64_t)a3;
- (void)setIPhoneCount:(unint64_t)a3;
- (void)setLegacyBeatsCount:(unint64_t)a3;
- (void)setLofiCount:(unint64_t)a3;
- (void)setMacCount:(unint64_t)a3;
- (void)setSetTopCount:(unint64_t)a3;
- (void)setSoloModelIdentifier:(id)a3;
- (void)setSoloProductIdentifier:(id)a3;
- (void)setTvCount:(unint64_t)a3;
- (void)setTvStickCount:(unint64_t)a3;
- (void)setUnknownCount:(unint64_t)a3;
- (void)setVehicleCount:(unint64_t)a3;
- (void)setVisionCount:(unint64_t)a3;
@end

@implementation MRGroupComposition

+ (id)multiBuiltInComposition
{
  v2 = objc_alloc_init(MRGroupComposition);
  [(MRGroupComposition *)v2 setBuiltInCount:2];

  return v2;
}

+ (id)homePodStereoPairComposition
{
  v2 = objc_alloc_init(MRGroupComposition);
  [(MRGroupComposition *)v2 setHomePodCount:2];

  return v2;
}

+ (id)homePodMiniStereoPairComposition
{
  v2 = objc_alloc_init(MRGroupComposition);
  [(MRGroupComposition *)v2 setHomePodMiniCount:2];

  return v2;
}

+ (id)homePodHomeTheaterComposition
{
  v2 = objc_alloc_init(MRGroupComposition);
  [(MRGroupComposition *)v2 setAtvCount:1];
  [(MRGroupComposition *)v2 setHomePodCount:1];

  return v2;
}

+ (id)homePodMiniHomeTheaterComposition
{
  v2 = objc_alloc_init(MRGroupComposition);
  [(MRGroupComposition *)v2 setAtvCount:1];
  [(MRGroupComposition *)v2 setHomePodMiniCount:1];

  return v2;
}

+ (id)unknownComposition
{
  v2 = objc_alloc_init(MRGroupComposition);
  [(MRGroupComposition *)v2 setUnknownCount:1];

  return v2;
}

- (unint64_t)totalCount
{
  unint64_t v3 = [(MRGroupComposition *)self atvCount];
  unint64_t v4 = [(MRGroupComposition *)self homePodCount] + v3;
  unint64_t v5 = [(MRGroupComposition *)self homePodMiniCount];
  unint64_t v6 = v4 + v5 + [(MRGroupComposition *)self headphoneCount];
  unint64_t v7 = [(MRGroupComposition *)self bluetoothSpeakerCount];
  unint64_t v8 = v7 + [(MRGroupComposition *)self setTopCount];
  unint64_t v9 = v6 + v8 + [(MRGroupComposition *)self tvStickCount];
  unint64_t v10 = [(MRGroupComposition *)self tvCount];
  unint64_t v11 = v10 + [(MRGroupComposition *)self macCount];
  unint64_t v12 = v11 + [(MRGroupComposition *)self hifiCount];
  unint64_t v13 = v9 + v12 + [(MRGroupComposition *)self lofiCount];
  unint64_t v14 = [(MRGroupComposition *)self builtInCount];
  unint64_t v15 = v14 + [(MRGroupComposition *)self legacyBeatsCount];
  unint64_t v16 = v15 + [(MRGroupComposition *)self iPhoneCount];
  unint64_t v17 = v16 + [(MRGroupComposition *)self visionCount];
  unint64_t v18 = v13 + v17 + [(MRGroupComposition *)self displayCount];
  unint64_t v19 = [(MRGroupComposition *)self carplayCount];
  unint64_t v20 = v19 + [(MRGroupComposition *)self vehicleCount];
  unint64_t v21 = v20 + [(MRGroupComposition *)self hearingDeviceCount];
  return v18 + v21 + [(MRGroupComposition *)self unknownCount];
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  unint64_t v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  unint64_t v6 = (void *)[v3 initWithFormat:@"<%@ (%p); ", v5, self];

  unint64_t v7 = [(MRGroupComposition *)self soloModelIdentifier];
  [v6 appendFormat:@"soloModelIdentifier: %@, ", v7];

  unint64_t v8 = [(MRGroupComposition *)self soloProductIdentifier];
  [v6 appendFormat:@"soloProductIdentifier: %@;", v8];

  objc_msgSend(v6, "appendFormat:", @"total count: %lu;", -[MRGroupComposition totalCount](self, "totalCount"));
  if ([(MRGroupComposition *)self atvCount]) {
    objc_msgSend(v6, "appendFormat:", @"atv: %lu;", -[MRGroupComposition atvCount](self, "atvCount"));
  }
  if ([(MRGroupComposition *)self homePodCount]) {
    objc_msgSend(v6, "appendFormat:", @"homePod: %lu;", -[MRGroupComposition homePodCount](self, "homePodCount"));
  }
  if ([(MRGroupComposition *)self homePodMiniCount]) {
    objc_msgSend(v6, "appendFormat:", @"homePodMini: %lu;",
  }
      [(MRGroupComposition *)self homePodMiniCount]);
  if ([(MRGroupComposition *)self headphoneCount]) {
    objc_msgSend(v6, "appendFormat:", @"headphone: %lu;",
  }
      [(MRGroupComposition *)self headphoneCount]);
  if ([(MRGroupComposition *)self bluetoothSpeakerCount]) {
    objc_msgSend(v6, "appendFormat:", @"bluetoothSpeaker: %lu;",
  }
      [(MRGroupComposition *)self bluetoothSpeakerCount]);
  if ([(MRGroupComposition *)self setTopCount]) {
    objc_msgSend(v6, "appendFormat:", @"setTop: %lu;", -[MRGroupComposition setTopCount](self, "setTopCount"));
  }
  if ([(MRGroupComposition *)self tvStickCount]) {
    objc_msgSend(v6, "appendFormat:", @"tvStick: %lu;", -[MRGroupComposition tvStickCount](self, "tvStickCount"));
  }
  if ([(MRGroupComposition *)self tvCount]) {
    objc_msgSend(v6, "appendFormat:", @"tv: %lu;", -[MRGroupComposition tvCount](self, "tvCount"));
  }
  if ([(MRGroupComposition *)self macCount]) {
    objc_msgSend(v6, "appendFormat:", @"mac: %lu;", -[MRGroupComposition macCount](self, "macCount"));
  }
  if ([(MRGroupComposition *)self hifiCount]) {
    objc_msgSend(v6, "appendFormat:", @"hifi: %lu;", -[MRGroupComposition hifiCount](self, "hifiCount"));
  }
  if ([(MRGroupComposition *)self lofiCount]) {
    objc_msgSend(v6, "appendFormat:", @"lofi: %lu;", -[MRGroupComposition lofiCount](self, "lofiCount"));
  }
  if ([(MRGroupComposition *)self builtInCount]) {
    objc_msgSend(v6, "appendFormat:", @"builtIn: %lu;", -[MRGroupComposition builtInCount](self, "builtInCount"));
  }
  if ([(MRGroupComposition *)self legacyBeatsCount]) {
    objc_msgSend(v6, "appendFormat:", @"legacyBeats: %lu;",
  }
      [(MRGroupComposition *)self legacyBeatsCount]);
  if ([(MRGroupComposition *)self iPhoneCount]) {
    objc_msgSend(v6, "appendFormat:", @"iPhone: %lu;", -[MRGroupComposition iPhoneCount](self, "iPhoneCount"));
  }
  if ([(MRGroupComposition *)self visionCount]) {
    objc_msgSend(v6, "appendFormat:", @"vision: %lu;", -[MRGroupComposition visionCount](self, "visionCount"));
  }
  if ([(MRGroupComposition *)self displayCount]) {
    objc_msgSend(v6, "appendFormat:", @"display: %lu;", -[MRGroupComposition displayCount](self, "displayCount"));
  }
  if ([(MRGroupComposition *)self carplayCount]) {
    objc_msgSend(v6, "appendFormat:", @"carplay: %lu;", -[MRGroupComposition carplayCount](self, "carplayCount"));
  }
  if ([(MRGroupComposition *)self vehicleCount]) {
    objc_msgSend(v6, "appendFormat:", @"vehicle: %lu;", -[MRGroupComposition vehicleCount](self, "vehicleCount"));
  }
  if ([(MRGroupComposition *)self hearingDeviceCount]) {
    objc_msgSend(v6, "appendFormat:", @"hearingDevice: %lu;",
  }
      [(MRGroupComposition *)self hearingDeviceCount]);
  if ([(MRGroupComposition *)self unknownCount]) {
    objc_msgSend(v6, "appendFormat:", @"unknown: %lu;", -[MRGroupComposition unknownCount](self, "unknownCount"));
  }
  [v6 appendString:@">"];

  return v6;
}

- (NSString)soloProductIdentifier
{
  return self->_soloProductIdentifier;
}

- (void)setSoloProductIdentifier:(id)a3
{
}

- (NSString)soloModelIdentifier
{
  return self->_soloModelIdentifier;
}

- (void)setSoloModelIdentifier:(id)a3
{
}

- (unint64_t)atvCount
{
  return self->_atvCount;
}

- (void)setAtvCount:(unint64_t)a3
{
  self->_atvCount = a3;
}

- (unint64_t)homePodCount
{
  return self->_homePodCount;
}

- (void)setHomePodCount:(unint64_t)a3
{
  self->_homePodCount = a3;
}

- (unint64_t)homePodMiniCount
{
  return self->_homePodMiniCount;
}

- (void)setHomePodMiniCount:(unint64_t)a3
{
  self->_homePodMiniCount = a3;
}

- (unint64_t)headphoneCount
{
  return self->_headphoneCount;
}

- (void)setHeadphoneCount:(unint64_t)a3
{
  self->_headphoneCount = a3;
}

- (unint64_t)bluetoothSpeakerCount
{
  return self->_bluetoothSpeakerCount;
}

- (void)setBluetoothSpeakerCount:(unint64_t)a3
{
  self->_bluetoothSpeakerCount = a3;
}

- (unint64_t)setTopCount
{
  return self->_setTopCount;
}

- (void)setSetTopCount:(unint64_t)a3
{
  self->_setTopCount = a3;
}

- (unint64_t)tvStickCount
{
  return self->_tvStickCount;
}

- (void)setTvStickCount:(unint64_t)a3
{
  self->_tvStickCount = a3;
}

- (unint64_t)tvCount
{
  return self->_tvCount;
}

- (void)setTvCount:(unint64_t)a3
{
  self->_tvCount = a3;
}

- (unint64_t)macCount
{
  return self->_macCount;
}

- (void)setMacCount:(unint64_t)a3
{
  self->_macCount = a3;
}

- (unint64_t)hifiCount
{
  return self->_hifiCount;
}

- (void)setHifiCount:(unint64_t)a3
{
  self->_hifiCount = a3;
}

- (unint64_t)lofiCount
{
  return self->_lofiCount;
}

- (void)setLofiCount:(unint64_t)a3
{
  self->_lofiCount = a3;
}

- (unint64_t)builtInCount
{
  return self->_builtInCount;
}

- (void)setBuiltInCount:(unint64_t)a3
{
  self->_builtInCount = a3;
}

- (unint64_t)legacyBeatsCount
{
  return self->_legacyBeatsCount;
}

- (void)setLegacyBeatsCount:(unint64_t)a3
{
  self->_legacyBeatsCount = a3;
}

- (unint64_t)iPhoneCount
{
  return self->_iPhoneCount;
}

- (void)setIPhoneCount:(unint64_t)a3
{
  self->_iPhoneCount = a3;
}

- (unint64_t)visionCount
{
  return self->_visionCount;
}

- (void)setVisionCount:(unint64_t)a3
{
  self->_visionCount = a3;
}

- (unint64_t)displayCount
{
  return self->_displayCount;
}

- (void)setDisplayCount:(unint64_t)a3
{
  self->_displayCount = a3;
}

- (unint64_t)carplayCount
{
  return self->_carplayCount;
}

- (void)setCarplayCount:(unint64_t)a3
{
  self->_carplayCount = a3;
}

- (unint64_t)vehicleCount
{
  return self->_vehicleCount;
}

- (void)setVehicleCount:(unint64_t)a3
{
  self->_vehicleCount = a3;
}

- (unint64_t)hearingDeviceCount
{
  return self->_hearingDeviceCount;
}

- (void)setHearingDeviceCount:(unint64_t)a3
{
  self->_hearingDeviceCount = a3;
}

- (unint64_t)unknownCount
{
  return self->_unknownCount;
}

- (void)setUnknownCount:(unint64_t)a3
{
  self->_unknownCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soloModelIdentifier, 0);

  objc_storeStrong((id *)&self->_soloProductIdentifier, 0);
}

@end