@interface MRExternalDeviceConnectionDetails
- (NSDate)startDate;
- (NSString)reason;
- (NSString)requestID;
- (id)completion;
- (id)description;
- (unsigned)qos;
- (void)setCompletion:(id)a3;
- (void)setQos:(unsigned int)a3;
- (void)setReason:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation MRExternalDeviceConnectionDetails

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(MRExternalDeviceConnectionDetails *)self startDate];
  v6 = [(MRExternalDeviceConnectionDetails *)self startDate];
  [v6 timeIntervalSinceNow];
  double v8 = -v7;
  v9 = [(MRExternalDeviceConnectionDetails *)self requestID];
  v10 = [(MRExternalDeviceConnectionDetails *)self reason];
  v11 = (void *)[v3 initWithFormat:@"<%@:%p %@ (%lf seconds ago) %@ %@ (%u)>", v4, self, v5, *(void *)&v8, v9, v10, -[MRExternalDeviceConnectionDetails qos](self, "qos")];

  return v11;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (unsigned)qos
{
  return self->_qos;
}

- (void)setQos:(unsigned int)a3
{
  self->_qos = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_reason, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end