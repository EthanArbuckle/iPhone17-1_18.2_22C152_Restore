@interface _VLLocalizerAltitudeQuery
- (CLLocation)location;
- (OS_dispatch_queue)callbackQueue;
- (_VLLocalizerAltitudeQuery)init;
- (_VLLocalizerAltitudeQuery)initWithLocation:(id)a3 callbackQueue:(id)a4 callback:(id)a5;
- (id)callback;
- (unint64_t)signpostID;
@end

@implementation _VLLocalizerAltitudeQuery

- (_VLLocalizerAltitudeQuery)init
{
  result = (_VLLocalizerAltitudeQuery *)[MEMORY[0x263EFF940] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (_VLLocalizerAltitudeQuery)initWithLocation:(id)a3 callbackQueue:(id)a4 callback:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_VLLocalizerAltitudeQuery;
  v12 = [(_VLLocalizerAltitudeQuery *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_location, a3);
    if (qword_26AC375D0 != -1) {
      dispatch_once(&qword_26AC375D0, &__block_literal_global_215);
    }
    v13->_signpostID = os_signpost_id_generate((os_log_t)qword_26AC375C8);
    objc_storeStrong((id *)&v13->_callbackQueue, a4);
    uint64_t v14 = [v11 copy];
    id callback = v13->_callback;
    v13->_id callback = (id)v14;

    v16 = v13;
  }

  return v13;
}

- (CLLocation)location
{
  return self->_location;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (id)callback
{
  return self->_callback;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end