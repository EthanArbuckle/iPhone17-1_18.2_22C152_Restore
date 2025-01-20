@interface ExtractedCellInfo
- (NSNumber)arfcn;
- (NSNumber)band;
- (NSNumber)bandwidth;
- (NSNumber)nrnsaArfcn;
- (NSNumber)nrnsaBandwidth;
- (NSString)frequencyRange;
- (NSString)gci;
- (NSString)nrnsaFrequencyRange;
- (NSString)rat;
- (id)description;
- (id)init:(id)a3 band:(id)a4 frequencyRange:(id)a5 nrnsaFrequencyRange:(id)a6 bandwidth:(id)a7 nrnsaBandwidth:(id)a8 arfcn:(id)a9 nrnsaArfcn:(id)a10 gci:(id)a11;
@end

@implementation ExtractedCellInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gci, 0);
  objc_storeStrong((id *)&self->_nrnsaArfcn, 0);
  objc_storeStrong((id *)&self->_arfcn, 0);
  objc_storeStrong((id *)&self->_nrnsaBandwidth, 0);
  objc_storeStrong((id *)&self->_bandwidth, 0);
  objc_storeStrong((id *)&self->_nrnsaFrequencyRange, 0);
  objc_storeStrong((id *)&self->_frequencyRange, 0);
  objc_storeStrong((id *)&self->_band, 0);

  objc_storeStrong((id *)&self->_rat, 0);
}

- (id)init:(id)a3 band:(id)a4 frequencyRange:(id)a5 nrnsaFrequencyRange:(id)a6 bandwidth:(id)a7 nrnsaBandwidth:(id)a8 arfcn:(id)a9 nrnsaArfcn:(id)a10 gci:(id)a11
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v22 = a10;
  id v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)ExtractedCellInfo;
  v19 = [(ExtractedCellInfo *)&v30 init];
  p_isa = (id *)&v19->super.isa;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_rat, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, a7);
    objc_storeStrong(p_isa + 6, a8);
    objc_storeStrong(p_isa + 7, a9);
    objc_storeStrong(p_isa + 8, a10);
    objc_storeStrong(p_isa + 9, a11);
  }

  return p_isa;
}

- (NSString)rat
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)gci
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)frequencyRange
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)bandwidth
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)band
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)arfcn
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)nrnsaFrequencyRange
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)nrnsaBandwidth
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)nrnsaArfcn
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (id)description
{
  v3 = [(ExtractedCellInfo *)self rat];
  v4 = [(ExtractedCellInfo *)self band];
  v5 = [(ExtractedCellInfo *)self frequencyRange];
  v6 = [(ExtractedCellInfo *)self nrnsaFrequencyRange];
  v7 = [(ExtractedCellInfo *)self bandwidth];
  v8 = [(ExtractedCellInfo *)self nrnsaBandwidth];
  v9 = [(ExtractedCellInfo *)self arfcn];
  v10 = [(ExtractedCellInfo *)self nrnsaArfcn];
  v11 = +[NSString stringWithFormat:@"rat %@, band %@, frequencyRange %@, nrnsaFrequencyRange %@, bandwidth %@, nrnsaBandwidth %@, arfcn %@, nrnsaArfcn %@", v3, v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

@end