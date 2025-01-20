@interface RatRetentionState
- (BOOL)dataPreferred;
- (BOOL)isSatelliteProvisioned;
- (BOOL)isSatelliteSystem;
- (NSNumber)arfcn;
- (NSNumber)band;
- (NSNumber)bandwidth;
- (NSNumber)nrnsaArfcn;
- (NSNumber)nrnsaBandwidth;
- (NSNumber)subsId;
- (NSString)dataBearerTechnology;
- (NSString)displayStatus;
- (NSString)frequencyRange;
- (NSString)lastKnownGci;
- (NSString)nrnsaFrequencyRange;
- (NSString)rat;
- (id)description;
- (id)init:(unint64_t)a3 displayStatus:(id)a4 rat:(id)a5 dataBearerTechnology:(id)a6 band:(id)a7 arfcn:(id)a8 nrnsaArfcn:(id)a9 bandwidth:(id)a10 nrnsaBandwidth:(id)a11 frequencyRange:(id)a12 nrnsaFrequencyRange:(id)a13 subsId:(id)a14 dataPreferred:(BOOL)a15 lastKnownGci:(id)a16 isSatelliteSystem:(BOOL)a17 isSatelliteProvisioned:(BOOL)a18 dataConnectionType:(unint64_t)a19;
- (unint64_t)dataConnectionType;
- (unint64_t)startTime;
- (void)setArfcn:(id)a3;
- (void)setBand:(id)a3;
- (void)setBandwidth:(id)a3;
- (void)setDataBearerTechnology:(id)a3;
- (void)setDataConnectionType:(unint64_t)a3;
- (void)setDataPreferred:(BOOL)a3;
- (void)setDisplayStatus:(id)a3;
- (void)setFrequencyRange:(id)a3;
- (void)setIsSatelliteProvisioned:(BOOL)a3;
- (void)setIsSatelliteSystem:(BOOL)a3;
- (void)setLastKnownGci:(id)a3;
- (void)setNrnsaArfcn:(id)a3;
- (void)setNrnsaBandwidth:(id)a3;
- (void)setNrnsaFrequencyRange:(id)a3;
- (void)setRat:(id)a3;
- (void)setStartTime:(unint64_t)a3;
- (void)setSubsId:(id)a3;
@end

@implementation RatRetentionState

- (unint64_t)startTime
{
  return self->_startTime;
}

- (NSString)frequencyRange
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)displayStatus
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)dataBearerTechnology
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)bandwidth
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (NSNumber)band
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)arfcn
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNrnsaFrequencyRange:(id)a3
{
}

- (void)setNrnsaBandwidth:(id)a3
{
}

- (void)setNrnsaArfcn:(id)a3
{
}

- (void)setLastKnownGci:(id)a3
{
}

- (NSString)rat
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isSatelliteSystem
{
  return self->_isSatelliteSystem;
}

- (NSNumber)subsId
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (void)setRat:(id)a3
{
}

- (void)setFrequencyRange:(id)a3
{
}

- (void)setBandwidth:(id)a3
{
}

- (void)setBand:(id)a3
{
}

- (void)setArfcn:(id)a3
{
}

- (BOOL)isSatelliteProvisioned
{
  return self->_isSatelliteProvisioned;
}

- (BOOL)dataPreferred
{
  return self->_dataPreferred;
}

- (unint64_t)dataConnectionType
{
  return self->_dataConnectionType;
}

- (id)init:(unint64_t)a3 displayStatus:(id)a4 rat:(id)a5 dataBearerTechnology:(id)a6 band:(id)a7 arfcn:(id)a8 nrnsaArfcn:(id)a9 bandwidth:(id)a10 nrnsaBandwidth:(id)a11 frequencyRange:(id)a12 nrnsaFrequencyRange:(id)a13 subsId:(id)a14 dataPreferred:(BOOL)a15 lastKnownGci:(id)a16 isSatelliteSystem:(BOOL)a17 isSatelliteProvisioned:(BOOL)a18 dataConnectionType:(unint64_t)a19
{
  id v23 = a4;
  id v24 = a5;
  id v25 = a6;
  id v40 = a7;
  id v39 = a8;
  v26 = v24;
  id v38 = a9;
  id v37 = a10;
  id v27 = a11;
  id v28 = a12;
  id v29 = a13;
  id v30 = a14;
  id v31 = a16;
  v41.receiver = self;
  v41.super_class = (Class)RatRetentionState;
  v32 = [(RatRetentionState *)&v41 init];
  v33 = v32;
  if (v32)
  {
    [(RatRetentionState *)v32 setStartTime:a3];
    [(RatRetentionState *)v33 setDisplayStatus:v23];
    [(RatRetentionState *)v33 setRat:v26];
    [(RatRetentionState *)v33 setDataBearerTechnology:v25];
    [(RatRetentionState *)v33 setBand:v40];
    [(RatRetentionState *)v33 setArfcn:v39];
    [(RatRetentionState *)v33 setNrnsaArfcn:v38];
    [(RatRetentionState *)v33 setBandwidth:v37];
    [(RatRetentionState *)v33 setNrnsaBandwidth:v27];
    [(RatRetentionState *)v33 setFrequencyRange:v28];
    [(RatRetentionState *)v33 setNrnsaFrequencyRange:v29];
    [(RatRetentionState *)v33 setDataPreferred:a15];
    [(RatRetentionState *)v33 setSubsId:v30];
    [(RatRetentionState *)v33 setLastKnownGci:v31];
    [(RatRetentionState *)v33 setIsSatelliteSystem:a17];
    [(RatRetentionState *)v33 setIsSatelliteProvisioned:a18];
    [(RatRetentionState *)v33 setDataConnectionType:a19];
  }

  return v33;
}

- (id)description
{
  unint64_t v3 = [(RatRetentionState *)self startTime];
  v21 = [(RatRetentionState *)self displayStatus];
  v20 = [(RatRetentionState *)self rat];
  v19 = [(RatRetentionState *)self dataBearerTechnology];
  v18 = [(RatRetentionState *)self band];
  v4 = [(RatRetentionState *)self arfcn];
  v5 = [(RatRetentionState *)self nrnsaArfcn];
  v6 = [(RatRetentionState *)self bandwidth];
  v7 = [(RatRetentionState *)self nrnsaBandwidth];
  v17 = [(RatRetentionState *)self frequencyRange];
  v16 = [(RatRetentionState *)self nrnsaFrequencyRange];
  id v13 = (id)v3;
  CFStringRef v8 = @"yes";
  if ([(RatRetentionState *)self dataPreferred]) {
    CFStringRef v9 = @"yes";
  }
  else {
    CFStringRef v9 = @"no";
  }
  v15 = [(RatRetentionState *)self subsId];
  if ([(RatRetentionState *)self isSatelliteSystem]) {
    CFStringRef v10 = @"yes";
  }
  else {
    CFStringRef v10 = @"no";
  }
  if (![(RatRetentionState *)self isSatelliteProvisioned]) {
    CFStringRef v8 = @"no";
  }
  v11 = +[WISSystemStatusSimulacrum WISSSDataConnectionTypeToString:[(RatRetentionState *)self dataConnectionType]];
  id v14 = +[NSString stringWithFormat:@"startTime %llu, displayStatus %@, rat %@, dataBearerTechnology %@, band %@, arfcn %@, nrnsaArfcn %@, bandwidth %@, nrnsaBandwidth %@, frequencyRange %@, nrnsaFrequencyRange %@, dataPreferred %@, subsId %@, isSatelliteSystem %@, isSatelliteProvisioned %@, dataConnectionType %@", v13, v21, v20, v19, v18, v4, v5, v6, v7, v17, v16, v9, v15, v10, v8, v11];

  return v14;
}

- (void)setDisplayStatus:(id)a3
{
}

- (void)setDataBearerTechnology:(id)a3
{
}

- (NSNumber)nrnsaArfcn
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (NSNumber)nrnsaBandwidth
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)nrnsaFrequencyRange
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDataPreferred:(BOOL)a3
{
  self->_dataPreferred = a3;
}

- (void)setSubsId:(id)a3
{
}

- (NSString)lastKnownGci
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setIsSatelliteSystem:(BOOL)a3
{
  self->_isSatelliteSystem = a3;
}

- (void)setIsSatelliteProvisioned:(BOOL)a3
{
  self->_isSatelliteProvisioned = a3;
}

- (void)setDataConnectionType:(unint64_t)a3
{
  self->_dataConnectionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownGci, 0);
  objc_storeStrong((id *)&self->_subsId, 0);
  objc_storeStrong((id *)&self->_nrnsaFrequencyRange, 0);
  objc_storeStrong((id *)&self->_frequencyRange, 0);
  objc_storeStrong((id *)&self->_nrnsaBandwidth, 0);
  objc_storeStrong((id *)&self->_bandwidth, 0);
  objc_storeStrong((id *)&self->_nrnsaArfcn, 0);
  objc_storeStrong((id *)&self->_arfcn, 0);
  objc_storeStrong((id *)&self->_band, 0);
  objc_storeStrong((id *)&self->_dataBearerTechnology, 0);
  objc_storeStrong((id *)&self->_rat, 0);

  objc_storeStrong((id *)&self->_displayStatus, 0);
}

@end