@interface TLTimelineOperation
- (TLIdentifiable)identifiable;
- (TLTimelineOperation)initWithIdentifiable:(id)a3;
@end

@implementation TLTimelineOperation

- (TLTimelineOperation)initWithIdentifiable:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLTimelineOperation;
  v5 = [(TLOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copyWithZone:0];
    identifiable = v5->_identifiable;
    v5->_identifiable = (TLIdentifiable *)v6;
  }
  return v5;
}

- (TLIdentifiable)identifiable
{
  return self->_identifiable;
}

- (void).cxx_destruct
{
}

@end