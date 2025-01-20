@interface CLIndoorPrefetchRegion
- (BOOL)mergeLocationOfInterest:(const void *)a3 clusterRadius:(double)a4;
- (ECEFCoordinate)ecef;
- (GeographicCoordinate)latlon;
- (id).cxx_construct;
- (id)initFromLOI:(const void *)a3;
- (time_point<std::chrono::system_clock,)relevancy:()time_point<std:(std:()std:(1000000>>>)a3 :ratio<1 :chrono::duration<long)long :chrono::system_clock;
- (void)dealloc;
@end

@implementation CLIndoorPrefetchRegion

- (id)initFromLOI:(const void *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CLIndoorPrefetchRegion;
  if ([(CLIndoorPrefetchRegion *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLIndoorPrefetchRegion;
  [(CLIndoorPrefetchRegion *)&v3 dealloc];
}

- (BOOL)mergeLocationOfInterest:(const void *)a3 clusterRadius:(double)a4
{
  [(GeographicCoordinate *)self->_latlon latitude];
  double v8 = v7;
  [(GeographicCoordinate *)self->_latlon longitude];
  double v10 = sub_1000A3D9C(v8, v9, *(double *)a3, *((double *)a3 + 1));
  if (v10 <= a4) {
    sub_1001C6F4C((uint64_t)self->_baseOfOperations.__ptr_.__value_, (uint64_t)a3);
  }
  return v10 <= a4;
}

- (time_point<std::chrono::system_clock,)relevancy:()time_point<std:(std:()std:(1000000>>>)a3 :ratio<1 :chrono::duration<long)long :chrono::system_clock
{
  value = self->_baseOfOperations.__ptr_.__value_;
  if (*((unsigned char *)value + 32)) {
    return *(time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000>>> *)((char *)value + 40);
  }
  return a3;
}

- (GeographicCoordinate)latlon
{
  return (GeographicCoordinate *)objc_getProperty(self, a2, 16, 1);
}

- (ECEFCoordinate)ecef
{
  return (ECEFCoordinate *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end