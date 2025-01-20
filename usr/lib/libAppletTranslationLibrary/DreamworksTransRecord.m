@interface DreamworksTransRecord
+ (id)recordNumber:(unsigned __int8)a3 recordData:(id)a4 seqnum:(unsigned int)a5;
- (NSDateComponents)datetime;
- (int)isIn;
- (unsigned)stationCode;
- (unsigned)vehicleType;
- (void)setDatetime:(id)a3;
- (void)setIsIn:(int)a3;
- (void)setStationCode:(unsigned int)a3;
- (void)setVehicleType:(unsigned __int16)a3;
@end

@implementation DreamworksTransRecord

+ (id)recordNumber:(unsigned __int8)a3 recordData:(id)a4 seqnum:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  [v8 setSfi:3];
  [v8 setNumber:v6];
  [v8 setData:v7];
  [v8 setIsIn:(objc_msgSend(v7, "u8:", 2) & 1) == 0];
  [v8 setStationCode:[v7 u32BE:5]];
  [v8 setVehicleType:[v7 u16BE:9]];
  unint64_t v9 = [v7 u64BE:11];

  v10 = [MEMORY[0x1E4F1C9D8] dateWithYear:(v9 >> 57) + 2000 month:(v9 >> 53) & 0xF day:HIWORD(v9) & 0x1F hour:(v9 >> 43) & 0x1F minute:(v9 >> 37) & 0x3F second:(v9 >> 31) & 0x3F];
  [v8 setDatetime:v10];

  [v8 setSeqnum:v5];

  return v8;
}

- (int)isIn
{
  return self->_isIn;
}

- (void)setIsIn:(int)a3
{
  self->_isIn = a3;
}

- (unsigned)vehicleType
{
  return self->_vehicleType;
}

- (void)setVehicleType:(unsigned __int16)a3
{
  self->_vehicleType = a3;
}

- (unsigned)stationCode
{
  return self->_stationCode;
}

- (void)setStationCode:(unsigned int)a3
{
  self->_stationCode = a3;
}

- (NSDateComponents)datetime
{
  return self->_datetime;
}

- (void)setDatetime:(id)a3
{
}

- (void).cxx_destruct
{
}

@end