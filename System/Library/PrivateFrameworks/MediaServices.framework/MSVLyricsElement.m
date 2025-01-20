@interface MSVLyricsElement
+ (id)_descriptionForElementType:(int64_t)a3;
- (BOOL)isBackgroundVocal;
- (MSVLyricsAgent)agent;
- (NSString)role;
- (double)endTime;
- (double)startTime;
- (id)description;
- (int64_t)type;
- (void)setAgent:(id)a3;
- (void)setEndTime:(double)a3;
- (void)setIsBackgroundVocal:(BOOL)a3;
- (void)setRole:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setType:(int64_t)a3;
@end

@implementation MSVLyricsElement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_agent, 0);
}

- (void)setIsBackgroundVocal:(BOOL)a3
{
  self->_isBackgroundVocal = a3;
}

- (BOOL)isBackgroundVocal
{
  return self->_isBackgroundVocal;
}

- (void)setRole:(id)a3
{
}

- (NSString)role
{
  return self->_role;
}

- (void)setAgent:(id)a3
{
}

- (MSVLyricsAgent)agent
{
  return self->_agent;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = +[MSVLyricsElement _descriptionForElementType:[(MSVLyricsElement *)self type]];
  [(MSVLyricsElement *)self startTime];
  uint64_t v7 = v6;
  [(MSVLyricsElement *)self endTime];
  uint64_t v9 = v8;
  v10 = [(MSVLyricsElement *)self agent];
  v14.receiver = self;
  v14.super_class = (Class)MSVLyricsElement;
  v11 = [(MSVLyricsXMLElement *)&v14 description];
  v12 = [v3 stringWithFormat:@"<%@ %p> Type: %@, start: %g, end:%g, agent: %@, XML element: %@", v4, self, v5, v7, v9, v10, v11];

  return v12;
}

+ (id)_descriptionForElementType:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return off_1E5AD9880[a3];
  }
}

@end