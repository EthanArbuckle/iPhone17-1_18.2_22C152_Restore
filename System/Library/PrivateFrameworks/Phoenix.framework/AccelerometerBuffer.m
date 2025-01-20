@interface AccelerometerBuffer
- ($01BB1521EC52D44A8E7628F5261DCEC8)data;
- (AccelerometerBuffer)bufferWithMovingSum:(id *)a3;
- (AccelerometerBuffer)initWithCapacity:(unint64_t)a3 accelerometerSampleRateInHz:(unint64_t)a4;
- (double)localMax;
- (double)localMaxAboveAverage;
- (double)localMin;
- (double)localMinBelowAverage;
- (id)buffer;
- (id)csv;
- (id)description;
- (id)logBuffer;
- (unint64_t)capacity;
- (void)_fillAccelBufferBeforeFirstSampleTimestamp:(double)a3;
- (void)addData:(id)a3 timestamp:(double)a4;
- (void)reset;
- (void)resetMovingSum;
- (void)setLocalMax:(double)a3;
- (void)setLocalMaxAboveAverage:(double)a3;
- (void)setLocalMin:(double)a3;
- (void)setLocalMinBelowAverage:(double)a3;
@end

@implementation AccelerometerBuffer

- (AccelerometerBuffer)initWithCapacity:(unint64_t)a3 accelerometerSampleRateInHz:(unint64_t)a4
{
  SEL v12 = a2;
  unint64_t v11 = a3;
  unint64_t v10 = a4;
  v13 = 0;
  v9.receiver = self;
  v9.super_class = (Class)AccelerometerBuffer;
  v13 = [(AccelerometerBuffer *)&v9 init];
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    id v4 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v5 = [v4 initWithCapacity:v11];
    accelBuffer = v13->_accelBuffer;
    v13->_accelBuffer = (NSMutableArray *)v5;

    v13->_bufferSize = v11;
    v13->_sampleRate = v10;
    v13->_movingSum.x = 0.0;
    v13->_movingSum.y = 0.0;
    v13->_movingSum.z = 0.0;
  }
  v8 = v13;
  objc_storeStrong((id *)&v13, 0);
  return v8;
}

- (id)buffer
{
  return self->_accelBuffer;
}

- (AccelerometerBuffer)bufferWithMovingSum:(id *)a3
{
  if (a3) {
    *($83A9B0F16167884A9BDC45564D3E7367 *)a3 = self->_movingSum;
  }
  return (AccelerometerBuffer *)self->_accelBuffer;
}

- (void)addData:(id)a3 timestamp:(double)a4
{
  $1AB5FA073B851C12C2339EC22442E995 v19 = a3;
  v18 = self;
  SEL v17 = a2;
  double v16 = a4;
  if ([(NSMutableArray *)self->_accelBuffer count] < self->_bufferSize)
  {
    [(AccelerometerBuffer *)v18 _fillAccelBufferBeforeFirstSampleTimestamp:v16];
  }
  else
  {
    id location = (id)[(NSMutableArray *)v18->_accelBuffer firstObject];
    if (location)
    {
      [location x];
      v18->_movingSum.x = v18->_movingSum.x - v4;
      [location y];
      v18->_movingSum.y = v18->_movingSum.y - v5;
      [location z];
      v18->_movingSum.z = v18->_movingSum.z - v6;
      [(NSMutableArray *)v18->_accelBuffer removeObject:location];
    }
    objc_storeStrong(&location, 0);
  }
  v18->_movingSum.x = v18->_movingSum.x + v19.var0;
  v18->_movingSum.y = v18->_movingSum.y + v19.var1;
  v18->_movingSum.z = v18->_movingSum.z + v19.var2;
  double v14 = v18->_movingSum.z / (double)v18->_bufferSize;
  [(AccelerometerBuffer *)v18 localMaxAboveAverage];
  [(AccelerometerBuffer *)v18 setLocalMaxAboveAverage:fmax(v7, v19.var2 - v14)];
  [(AccelerometerBuffer *)v18 localMinBelowAverage];
  [(AccelerometerBuffer *)v18 setLocalMinBelowAverage:fmin(v8, v19.var2 - v14)];
  [(AccelerometerBuffer *)v18 localMax];
  [(AccelerometerBuffer *)v18 setLocalMax:fmax(v9, v19.var2)];
  [(AccelerometerBuffer *)v18 localMin];
  [(AccelerometerBuffer *)v18 setLocalMin:fmin(v10, v19.var2)];
  accelBuffer = v18->_accelBuffer;
  unint64_t v11 = [AccelerometerData alloc];
  v13 = -[AccelerometerData initWithData:timestamp:](v11, "initWithData:timestamp:", v19.var0, v19.var1, v19.var2, v16);
  -[NSMutableArray addObject:](accelBuffer, "addObject:");
}

- (void)_fillAccelBufferBeforeFirstSampleTimestamp:(double)a3
{
  unint64_t v6 = self->_bufferSize - 1;
  for (unint64_t i = 0; i < v6; ++i)
  {
    accelBuffer = self->_accelBuffer;
    double v4 = -[AccelerometerData initWithData:timestamp:]([AccelerometerData alloc], "initWithData:timestamp:", 0.0, 0.0, 0.0, a3 - (double)((v6 - i) / self->_sampleRate));
    -[NSMutableArray addObject:](accelBuffer, "addObject:");
  }
}

- (void)reset
{
}

- (void)resetMovingSum
{
  self->_movingSum.x = 0.0;
  self->_movingSum.y = 0.0;
  self->_movingSum.z = 0.0;
  -[AccelerometerBuffer setLocalMaxAboveAverage:](self, "setLocalMaxAboveAverage:");
  [(AccelerometerBuffer *)self setLocalMinBelowAverage:0.0];
  [(AccelerometerBuffer *)self setLocalMax:0.0];
  [(AccelerometerBuffer *)self setLocalMin:0.0];
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)data
{
  id v15 = (id)[(NSMutableArray *)self->_accelBuffer firstObject];
  [v15 timestamp];
  double v17 = v2;
  id v13 = (id)[(NSMutableArray *)self->_accelBuffer lastObject];
  [v13 timestamp];
  double v18 = v3;
  [(AccelerometerBuffer *)self localMaxAboveAverage];
  double v12 = v4;
  [(AccelerometerBuffer *)self localMinBelowAverage];
  double v19 = v12 - v5;
  [(AccelerometerBuffer *)self localMax];
  double v14 = v6;
  [(AccelerometerBuffer *)self localMin];
  double v20 = v14 - v7;

  double v8 = v17;
  double v9 = v18;
  double v10 = v19;
  double v11 = v20;
  result.var3 = v11;
  result.var2 = v10;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (id)logBuffer
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v33 = self;
  SEL v32 = a2;
  uint64_t v31 = 25;
  uint64_t v26 = 0;
  v27 = &v26;
  int v28 = 0x20000000;
  int v29 = 32;
  uint64_t v30 = 0;
  id v8 = objc_alloc(MEMORY[0x263EFF980]);
  id v25 = (id)[v8 initWithCapacity:v31];
  accelBuffer = v33->_accelBuffer;
  uint64_t v19 = MEMORY[0x263EF8330];
  int v20 = -1073741824;
  int v21 = 0;
  v22 = __32__AccelerometerBuffer_logBuffer__block_invoke;
  v23 = &unk_264CCE4A0;
  v24[0] = v25;
  v24[2] = (id)v31;
  v24[1] = &v26;
  [(NSMutableArray *)accelBuffer enumerateObjectsUsingBlock:&v19];
  if ([v25 count])
  {
    id v18 = (id)AXLogBackTap();
    os_log_type_t v17 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = v27[3];
      id v5 = (id)[v25 componentsJoinedByString:@":"];
      id location = v5;
      __os_log_helper_16_2_3_8_32_8_0_8_64((uint64_t)v34, (uint64_t)"-[AccelerometerBuffer logBuffer]", v6, (uint64_t)location);
      _os_log_impl(&dword_2372C8000, (os_log_t)v18, v17, "[PHOENIX] %s [ix=%lu] accelerometer[t,x,y,z]:%@", v34, 0x20u);

      objc_storeStrong(&location, 0);
    }
    objc_storeStrong(&v18, 0);
    [v25 removeAllObjects];
  }
  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  double v4 = v33->_accelBuffer;
  uint64_t v9 = MEMORY[0x263EF8330];
  int v10 = -1073741824;
  int v11 = 0;
  double v12 = __32__AccelerometerBuffer_logBuffer__block_invoke_41;
  id v13 = &unk_264CCE4C8;
  id v14 = v15;
  [(NSMutableArray *)v4 enumerateObjectsUsingBlock:&v9];
  id v3 = v15;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v24, 0);
  objc_storeStrong(&v25, 0);
  _Block_object_dispose(&v26, 8);
  return v3;
}

void __32__AccelerometerBuffer_logBuffer__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v22[3] = a3;
  v22[2] = a4;
  v22[1] = (id)a1;
  os_log_type_t v17 = NSString;
  [location[0] timestamp];
  uint64_t v14 = v4;
  [location[0] x];
  uint64_t v15 = v5;
  [location[0] y];
  uint64_t v16 = v6;
  [location[0] z];
  v22[0] = (id)objc_msgSend(v17, "stringWithFormat:", @"%.5f,%.5f,%.5f,%.5f", v14, v15, v16, v7);
  [*(id *)(a1 + 32) addObject:v22[0]];
  if ([*(id *)(a1 + 32) count] == *(void *)(a1 + 48))
  {
    id v21 = (id)AXLogBackTap();
    char v20 = 1;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_INFO))
    {
      log = v21;
      os_log_type_t type = v20;
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      id v11 = (id)[*(id *)(a1 + 32) componentsJoinedByString:@":"];
      id v19 = v11;
      __os_log_helper_16_2_3_8_32_8_0_8_64((uint64_t)v24, (uint64_t)"-[AccelerometerBuffer logBuffer]_block_invoke", v8, (uint64_t)v19);
      _os_log_impl(&dword_2372C8000, log, type, "[PHOENIX] %s [ix=%lu] accelerometer[t,x,y,z]:%@", v24, 0x20u);

      objc_storeStrong(&v19, 0);
    }
    objc_storeStrong(&v21, 0);
    [*(id *)(a1 + 32) removeAllObjects];
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  objc_storeStrong(v22, 0);
  objc_storeStrong(location, 0);
}

void __32__AccelerometerBuffer_logBuffer__block_invoke_41(id *a1, void *a2, void *a3, void *a4)
{
  v18[4] = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v15[3] = a3;
  v15[2] = a4;
  v15[1] = a1;
  v17[0] = @"timestamp";
  uint64_t v6 = NSNumber;
  [location[0] timestamp];
  id v13 = (id)objc_msgSend(v6, "numberWithDouble:");
  v18[0] = v13;
  v17[1] = @"x";
  uint64_t v7 = NSNumber;
  [location[0] x];
  id v12 = (id)objc_msgSend(v7, "numberWithDouble:");
  v18[1] = v12;
  v17[2] = @"y";
  uint64_t v8 = NSNumber;
  [location[0] y];
  id v11 = (id)objc_msgSend(v8, "numberWithDouble:");
  v18[2] = v11;
  v17[3] = @"z";
  uint64_t v9 = NSNumber;
  [location[0] z];
  id v10 = (id)objc_msgSend(v9, "numberWithDouble:");
  v18[3] = v10;
  v15[0] = (id)[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];

  [a1[4] addObject:v15[0]];
  objc_storeStrong(v15, 0);
  objc_storeStrong(location, 0);
}

- (id)csv
{
  uint64_t v7 = self;
  v6[1] = (id)a2;
  v6[0] = objc_alloc_init(MEMORY[0x263F089D8]);
  [v6[0] appendString:@"timestamp,x,y,z\n"];
  accelBuffer = v7->_accelBuffer;
  id v5 = v6[0];
  -[NSMutableArray enumerateObjectsUsingBlock:](accelBuffer, "enumerateObjectsUsingBlock:");
  id v4 = v6[0];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);
  return v4;
}

void __26__AccelerometerBuffer_csv__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v7 = (void *)a1[4];
  id v3 = NSNumber;
  [location[0] timestamp];
  id v11 = (id)objc_msgSend(v3, "numberWithDouble:");
  id v4 = NSNumber;
  [location[0] x];
  id v10 = (id)objc_msgSend(v4, "numberWithDouble:");
  id v5 = NSNumber;
  [location[0] y];
  id v9 = (id)objc_msgSend(v5, "numberWithDouble:");
  uint64_t v6 = NSNumber;
  [location[0] z];
  id v8 = (id)objc_msgSend(v6, "numberWithDouble:");
  [v7 appendFormat:@"%@,%@,%@,%@\n", v11, v10, v9, v8];

  objc_storeStrong(location, 0);
}

- (unint64_t)capacity
{
  return self->_bufferSize;
}

- (id)description
{
  uint64_t v7 = self;
  v6[1] = (id)a2;
  v6[0] = objc_alloc_init(MEMORY[0x263F089D8]);
  accelBuffer = v7->_accelBuffer;
  id v5 = v6[0];
  -[NSMutableArray enumerateObjectsUsingBlock:](accelBuffer, "enumerateObjectsUsingBlock:");
  id v4 = v6[0];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);
  return v4;
}

void __34__AccelerometerBuffer_description__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (void *)a1[4];
  id v4 = (id)[location[0] description];
  [v3 appendFormat:@"%@\n", v4];

  objc_storeStrong(location, 0);
}

- (double)localMinBelowAverage
{
  return self->_localMinBelowAverage;
}

- (void)setLocalMinBelowAverage:(double)a3
{
  self->_localMinBelowAverage = a3;
}

- (double)localMaxAboveAverage
{
  return self->_localMaxAboveAverage;
}

- (void)setLocalMaxAboveAverage:(double)a3
{
  self->_localMaxAboveAverage = a3;
}

- (double)localMin
{
  return self->_localMin;
}

- (void)setLocalMin:(double)a3
{
  self->_localMin = a3;
}

- (double)localMax
{
  return self->_localMax;
}

- (void)setLocalMax:(double)a3
{
  self->_localMax = a3;
}

- (void).cxx_destruct
{
}

@end