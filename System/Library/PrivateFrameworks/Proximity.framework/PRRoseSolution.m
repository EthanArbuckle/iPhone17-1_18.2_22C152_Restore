@interface PRRoseSolution
+ (BOOL)supportsSecureCoding;
- (BOOL)az_valid;
- (BOOL)el_valid;
- (BOOL)isEqual:(id)a3;
- (BOOL)mach_continuous_time_valid;
- (BOOL)multipath_probability_valid;
- (BOOL)previous_solution_is_bad;
- (BOOL)soi_rssi_valid;
- (BOOL)sweep_angle_valid;
- (BOOL)track_score_valid;
- (PRRoseSolution)initWithCoder:(id)a3;
- (PRRoseSolution)initWithVariant:(int64_t)a3 macAddr:(unint64_t)a4 machAbsTime_sec:(double)a5 machContTimeValid:(BOOL)a6 machContTime_sec:(double)a7 range_m:(double)a8 rangeUnc_m:(double)a9 azValid:(BOOL)a10 elValid:(BOOL)a11 az_deg:(double)a12 el_deg:(double)a13 azUnc_deg:(double)a14 elUnc_deg:(double)a15 fovConfidence:(double)a16 soiRssiValid:(BOOL)a17 soiRssi_dBm:(double)a18 antennaType:(int64_t)a19 prevSolutionIsBad:(BOOL)a20 trackScoreValid:(BOOL)a21 trackScore:(double)a22 sweepAngleValid:(BOOL)a23 sweepAngle_deg:(double)a24 multipathProbabilityValid:(BOOL)a25 multipathProbability:(double)a26;
- (double)az_deg;
- (double)az_unc_deg;
- (double)el_deg;
- (double)el_unc_deg;
- (double)fov_confidence;
- (double)mach_absolute_time_sec;
- (double)mach_continuous_time_sec;
- (double)multipath_probability;
- (double)range_m;
- (double)range_unc_m;
- (double)soi_rssi_dbm;
- (double)sweep_angle_deg;
- (double)track_score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)antenna_type;
- (int64_t)variant;
- (unint64_t)mac_addr;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRRoseSolution

- (PRRoseSolution)initWithVariant:(int64_t)a3 macAddr:(unint64_t)a4 machAbsTime_sec:(double)a5 machContTimeValid:(BOOL)a6 machContTime_sec:(double)a7 range_m:(double)a8 rangeUnc_m:(double)a9 azValid:(BOOL)a10 elValid:(BOOL)a11 az_deg:(double)a12 el_deg:(double)a13 azUnc_deg:(double)a14 elUnc_deg:(double)a15 fovConfidence:(double)a16 soiRssiValid:(BOOL)a17 soiRssi_dBm:(double)a18 antennaType:(int64_t)a19 prevSolutionIsBad:(BOOL)a20 trackScoreValid:(BOOL)a21 trackScore:(double)a22 sweepAngleValid:(BOOL)a23 sweepAngle_deg:(double)a24 multipathProbabilityValid:(BOOL)a25 multipathProbability:(double)a26
{
  BOOL v26 = a17;
  BOOL v27 = a11;
  BOOL v28 = a10;
  BOOL v29 = a6;
  v50.receiver = self;
  v50.super_class = (Class)PRRoseSolution;
  result = [(PRRoseSolution *)&v50 init];
  if (result)
  {
    result->_variant = a3;
    result->_mac_addr = a4;
    result->_mach_continuous_time_valid = v29;
    if (v29) {
      double v45 = a7;
    }
    else {
      double v45 = 0.0;
    }
    result->_mach_absolute_time_sec = a5;
    result->_mach_continuous_time_sec = v45;
    result->_range_m = a8;
    result->_range_unc_m = a9;
    result->_az_valid = v28;
    result->_el_valid = v27;
    if (v28) {
      double v46 = a12;
    }
    else {
      double v46 = 0.0;
    }
    if (v28) {
      double v47 = a14;
    }
    else {
      double v47 = 0.0;
    }
    if (v27) {
      double v48 = a13;
    }
    else {
      double v48 = 0.0;
    }
    result->_az_deg = v46;
    result->_el_deg = v48;
    if (v27) {
      double v49 = a15;
    }
    else {
      double v49 = 0.0;
    }
    result->_az_unc_deg = v47;
    result->_el_unc_deg = v49;
    result->_soi_rssi_valid = v26;
    if (!v26) {
      a18 = 0.0;
    }
    result->_fov_confidence = a16;
    result->_soi_rssi_dbm = a18;
    result->_antenna_type = a19;
    result->_previous_solution_is_bad = a20;
    result->_track_score_valid = a21;
    if (!a21) {
      a22 = 0.0;
    }
    result->_sweep_angle_valid = a23;
    if (!a23) {
      a24 = 0.0;
    }
    result->_track_score = a22;
    result->_sweep_angle_deg = a24;
    result->_multipath_probability_valid = a25;
    if (!a25) {
      a26 = 0.0;
    }
    result->_multipath_probability = a26;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRRoseSolution)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v43 = [v3 decodeIntegerForKey:@"variant"];
  uint64_t v44 = [v3 decodeInt64ForKey:@"macAddr"];
  [v3 decodeDoubleForKey:@"machAbsTime"];
  double v42 = v4;
  uint64_t v5 = [v3 decodeBoolForKey:@"machContTimeValid"];
  [v3 decodeDoubleForKey:@"machContTime"];
  double v41 = v6;
  [v3 decodeDoubleForKey:@"range"];
  double v40 = v7;
  [v3 decodeDoubleForKey:@"rangeUnc"];
  double v39 = v8;
  uint64_t v9 = [v3 decodeBoolForKey:@"azValid"];
  uint64_t v10 = [v3 decodeBoolForKey:@"elValid"];
  [v3 decodeDoubleForKey:@"az"];
  double v38 = v11;
  [v3 decodeDoubleForKey:@"el"];
  double v13 = v12;
  [v3 decodeDoubleForKey:@"azUnc"];
  double v15 = v14;
  [v3 decodeDoubleForKey:@"elUnc"];
  double v17 = v16;
  [v3 decodeDoubleForKey:@"fovConfidence"];
  uint64_t v19 = v18;
  uint64_t v20 = [v3 decodeBoolForKey:@"soiRssiValid"];
  [v3 decodeDoubleForKey:@"soiRssi"];
  uint64_t v22 = v21;
  uint64_t v23 = [v3 decodeIntegerForKey:@"antennaType"];
  char v24 = [v3 decodeBoolForKey:@"prevSolutionIsBad"];
  char v25 = [v3 decodeBoolForKey:@"trackScoreValid"];
  [v3 decodeDoubleForKey:@"trackScore"];
  uint64_t v27 = v26;
  char v28 = [v3 decodeBoolForKey:@"sweepAngleValid"];
  [v3 decodeDoubleForKey:@"sweepAngleDeg"];
  uint64_t v30 = v29;
  char v31 = [v3 decodeBoolForKey:@"multipathProbabilityValid"];
  [v3 decodeDoubleForKey:@"multipathProbability"];
  uint64_t v33 = v32;

  LOBYTE(v37) = v31;
  LOBYTE(v36) = v28;
  BYTE1(v35) = v25;
  LOBYTE(v35) = v24;
  return -[PRRoseSolution initWithVariant:macAddr:machAbsTime_sec:machContTimeValid:machContTime_sec:range_m:rangeUnc_m:azValid:elValid:az_deg:el_deg:azUnc_deg:elUnc_deg:fovConfidence:soiRssiValid:soiRssi_dBm:antennaType:prevSolutionIsBad:trackScoreValid:trackScore:sweepAngleValid:sweepAngle_deg:multipathProbabilityValid:multipathProbability:](self, "initWithVariant:macAddr:machAbsTime_sec:machContTimeValid:machContTime_sec:range_m:rangeUnc_m:azValid:elValid:az_deg:el_deg:azUnc_deg:elUnc_deg:fovConfidence:soiRssiValid:soiRssi_dBm:antennaType:prevSolutionIsBad:trackScoreValid:trackScore:sweepAngleValid:sweepAngle_deg:multipathProbabilityValid:multipathProbability:", v43, v44, v5, v9, v10, v20, v42, v41, v40, v39, v38, v13, v15, v17, v19,
           v22,
           v23,
           v35,
           v27,
           v36,
           v30,
           v37,
           v33);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t variant = self->_variant;
  id v5 = a3;
  [v5 encodeInteger:variant forKey:@"variant"];
  [v5 encodeInt64:self->_mac_addr forKey:@"macAddr"];
  [v5 encodeDouble:@"machAbsTime" forKey:self->_mach_absolute_time_sec];
  [v5 encodeBool:self->_mach_continuous_time_valid forKey:@"machContTimeValid"];
  [v5 encodeDouble:@"machContTime" forKey:self->_mach_continuous_time_sec];
  [v5 encodeDouble:@"range" forKey:self->_range_m];
  [v5 encodeDouble:@"rangeUnc" forKey:self->_range_unc_m];
  [v5 encodeBool:self->_az_valid forKey:@"azValid"];
  [v5 encodeBool:self->_el_valid forKey:@"elValid"];
  [v5 encodeDouble:@"az" forKey:self->_az_deg];
  [v5 encodeDouble:@"el" forKey:self->_el_deg];
  [v5 encodeDouble:@"azUnc" forKey:self->_az_unc_deg];
  [v5 encodeDouble:@"elUnc" forKey:self->_el_unc_deg];
  [v5 encodeDouble:@"fovConfidence" forKey:self->_fov_confidence];
  [v5 encodeBool:self->_soi_rssi_valid forKey:@"soiRssiValid"];
  [v5 encodeDouble:@"soiRssi" forKey:self->_soi_rssi_dbm];
  [v5 encodeInteger:self->_antenna_type forKey:@"antennaType"];
  [v5 encodeBool:self->_previous_solution_is_bad forKey:@"prevSolutionIsBad"];
  [v5 encodeBool:self->_track_score_valid forKey:@"trackScoreValid"];
  [v5 encodeDouble:@"trackScore" forKey:self->_track_score];
  [v5 encodeBool:self->_sweep_angle_valid forKey:@"sweepAngleValid"];
  [v5 encodeDouble:@"sweepAngleDeg" forKey:self->_sweep_angle_deg];
  [v5 encodeBool:self->_multipath_probability_valid forKey:@"multipathProbabilityValid"];
  [v5 encodeDouble:@"multipathProbability" forKey:self->_multipath_probability];
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = [PRRoseSolution alloc];
  LOBYTE(v8) = self->_multipath_probability_valid;
  LOBYTE(v7) = self->_sweep_angle_valid;
  LOWORD(v6) = *(_WORD *)&self->_previous_solution_is_bad;
  return -[PRRoseSolution initWithVariant:macAddr:machAbsTime_sec:machContTimeValid:machContTime_sec:range_m:rangeUnc_m:azValid:elValid:az_deg:el_deg:azUnc_deg:elUnc_deg:fovConfidence:soiRssiValid:soiRssi_dBm:antennaType:prevSolutionIsBad:trackScoreValid:trackScore:sweepAngleValid:sweepAngle_deg:multipathProbabilityValid:multipathProbability:](v4, "initWithVariant:macAddr:machAbsTime_sec:machContTimeValid:machContTime_sec:range_m:rangeUnc_m:azValid:elValid:az_deg:el_deg:azUnc_deg:elUnc_deg:fovConfidence:soiRssiValid:soiRssi_dBm:antennaType:prevSolutionIsBad:trackScoreValid:trackScore:sweepAngleValid:sweepAngle_deg:multipathProbabilityValid:multipathProbability:", self->_variant, self->_mac_addr, self->_mach_continuous_time_valid, self->_az_valid, self->_el_valid, self->_soi_rssi_valid, self->_mach_absolute_time_sec, self->_mach_continuous_time_sec, self->_range_m, self->_range_unc_m, self->_az_deg, self->_el_deg, self->_az_unc_deg, self->_el_unc_deg, *(void *)&self->_fov_confidence,
           *(void *)&self->_soi_rssi_dbm,
           self->_antenna_type,
           v6,
           *(void *)&self->_track_score,
           v7,
           *(void *)&self->_sweep_angle_deg,
           v8,
           *(void *)&self->_multipath_probability);
}

- (id)description
{
  unint64_t variant = self->_variant;
  if (variant > 2) {
    id v3 = @"InvalidEnumValue";
  }
  else {
    id v3 = off_1E5999D10[variant];
  }
  unint64_t antenna_type = self->_antenna_type;
  if (antenna_type > 4) {
    id v5 = @"InvalidEnumValue";
  }
  else {
    id v5 = off_1E5999D28[antenna_type];
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"RoseSolution: variant: %@, mac_addr: 0x%016llx, mach_abs_time_sec: %.6f, mach_cont_time_valid: %d, mach_cont_time_sec: %.6f, range_m: %.3f, range_unc_m: %.3f, az_valid: %d, el_valid: %d, az_deg: %.3f, el_deg: %.3f, az_unc_deg: %.3f, el_unc_deg: %.3f, fov_confidence: %.3f, soi_rssi_valid: %d, soi_rssi_dbm: %.3f, antenna_type: %@, previous_solution_is_bad: %d, track_score_valid: %d, track_score: %.1f, sweep_angle_valid: %d, sweep_angle_deg: %.1f, multipath_probability_valid: %d, multipath_probability: %.2f", v3, self->_mac_addr, *(void *)&self->_mach_absolute_time_sec, self->_mach_continuous_time_valid, *(void *)&self->_mach_continuous_time_sec, *(void *)&self->_range_m, *(void *)&self->_range_unc_m, self->_az_valid, self->_el_valid, *(void *)&self->_az_deg, *(void *)&self->_el_deg, *(void *)&self->_az_unc_deg, *(void *)&self->_el_unc_deg, *(void *)&self->_fov_confidence, self->_soi_rssi_valid, *(void *)&self->_soi_rssi_dbm,
               v5,
               self->_previous_solution_is_bad,
               self->_track_score_valid,
               *(void *)&self->_track_score,
               self->_sweep_angle_valid,
               *(void *)&self->_sweep_angle_deg,
               self->_multipath_probability_valid,
               *(void *)&self->_multipath_probability);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(PRRoseSolution *)self variant];
    if (v6 != [v5 variant]) {
      goto LABEL_25;
    }
    unint64_t v7 = [(PRRoseSolution *)self mac_addr];
    if (v7 != objc_msgSend(v5, "mac_addr")) {
      goto LABEL_25;
    }
    [(PRRoseSolution *)self mach_absolute_time_sec];
    double v9 = v8;
    objc_msgSend(v5, "mach_absolute_time_sec");
    if (v9 != v10) {
      goto LABEL_25;
    }
    int v11 = [(PRRoseSolution *)self mach_continuous_time_valid];
    if (v11 != objc_msgSend(v5, "mach_continuous_time_valid")) {
      goto LABEL_25;
    }
    [(PRRoseSolution *)self mach_continuous_time_sec];
    double v13 = v12;
    objc_msgSend(v5, "mach_continuous_time_sec");
    if (v13 != v14) {
      goto LABEL_25;
    }
    [(PRRoseSolution *)self range_m];
    double v16 = v15;
    objc_msgSend(v5, "range_m");
    if (v16 != v17) {
      goto LABEL_25;
    }
    [(PRRoseSolution *)self range_unc_m];
    double v19 = v18;
    objc_msgSend(v5, "range_unc_m");
    if (v19 != v20) {
      goto LABEL_25;
    }
    int v21 = [(PRRoseSolution *)self az_valid];
    if (v21 != objc_msgSend(v5, "az_valid")) {
      goto LABEL_25;
    }
    int v22 = [(PRRoseSolution *)self el_valid];
    if (v22 != objc_msgSend(v5, "el_valid")) {
      goto LABEL_25;
    }
    [(PRRoseSolution *)self az_deg];
    double v24 = v23;
    objc_msgSend(v5, "az_deg");
    if (v24 != v25) {
      goto LABEL_25;
    }
    [(PRRoseSolution *)self el_deg];
    double v27 = v26;
    objc_msgSend(v5, "el_deg");
    if (v27 != v28) {
      goto LABEL_25;
    }
    [(PRRoseSolution *)self az_unc_deg];
    double v30 = v29;
    objc_msgSend(v5, "az_unc_deg");
    if (v30 != v31) {
      goto LABEL_25;
    }
    [(PRRoseSolution *)self el_unc_deg];
    double v33 = v32;
    objc_msgSend(v5, "el_unc_deg");
    if (v33 != v34) {
      goto LABEL_25;
    }
    [(PRRoseSolution *)self fov_confidence];
    double v36 = v35;
    objc_msgSend(v5, "fov_confidence");
    if (v36 != v37) {
      goto LABEL_25;
    }
    int v38 = [(PRRoseSolution *)self soi_rssi_valid];
    if (v38 != objc_msgSend(v5, "soi_rssi_valid")) {
      goto LABEL_25;
    }
    [(PRRoseSolution *)self soi_rssi_dbm];
    double v40 = v39;
    objc_msgSend(v5, "soi_rssi_dbm");
    if (v40 != v41) {
      goto LABEL_25;
    }
    int64_t v42 = [(PRRoseSolution *)self antenna_type];
    if (v42 != objc_msgSend(v5, "antenna_type")) {
      goto LABEL_25;
    }
    int v43 = [(PRRoseSolution *)self previous_solution_is_bad];
    if (v43 != objc_msgSend(v5, "previous_solution_is_bad")) {
      goto LABEL_25;
    }
    int v44 = [(PRRoseSolution *)self track_score_valid];
    if (v44 != objc_msgSend(v5, "track_score_valid")) {
      goto LABEL_25;
    }
    [(PRRoseSolution *)self track_score];
    double v46 = v45;
    objc_msgSend(v5, "track_score");
    if (v46 != v47) {
      goto LABEL_25;
    }
    int v48 = [(PRRoseSolution *)self sweep_angle_valid];
    if (v48 == objc_msgSend(v5, "sweep_angle_valid")
      && ([(PRRoseSolution *)self sweep_angle_deg],
          double v50 = v49,
          objc_msgSend(v5, "sweep_angle_deg"),
          v50 == v51)
      && (int v52 = [(PRRoseSolution *)self multipath_probability_valid],
          v52 == objc_msgSend(v5, "multipath_probability_valid")))
    {
      [(PRRoseSolution *)self multipath_probability];
      double v56 = v55;
      objc_msgSend(v5, "multipath_probability");
      BOOL v53 = v56 == v57;
    }
    else
    {
LABEL_25:
      BOOL v53 = 0;
    }
  }
  else
  {
    BOOL v53 = 0;
  }

  return v53;
}

- (int64_t)variant
{
  return self->_variant;
}

- (unint64_t)mac_addr
{
  return self->_mac_addr;
}

- (double)mach_absolute_time_sec
{
  return self->_mach_absolute_time_sec;
}

- (BOOL)mach_continuous_time_valid
{
  return self->_mach_continuous_time_valid;
}

- (double)mach_continuous_time_sec
{
  return self->_mach_continuous_time_sec;
}

- (double)range_m
{
  return self->_range_m;
}

- (double)range_unc_m
{
  return self->_range_unc_m;
}

- (BOOL)az_valid
{
  return self->_az_valid;
}

- (BOOL)el_valid
{
  return self->_el_valid;
}

- (double)az_deg
{
  return self->_az_deg;
}

- (double)el_deg
{
  return self->_el_deg;
}

- (double)az_unc_deg
{
  return self->_az_unc_deg;
}

- (double)el_unc_deg
{
  return self->_el_unc_deg;
}

- (double)fov_confidence
{
  return self->_fov_confidence;
}

- (BOOL)soi_rssi_valid
{
  return self->_soi_rssi_valid;
}

- (double)soi_rssi_dbm
{
  return self->_soi_rssi_dbm;
}

- (int64_t)antenna_type
{
  return self->_antenna_type;
}

- (BOOL)previous_solution_is_bad
{
  return self->_previous_solution_is_bad;
}

- (BOOL)track_score_valid
{
  return self->_track_score_valid;
}

- (double)track_score
{
  return self->_track_score;
}

- (BOOL)sweep_angle_valid
{
  return self->_sweep_angle_valid;
}

- (double)sweep_angle_deg
{
  return self->_sweep_angle_deg;
}

- (BOOL)multipath_probability_valid
{
  return self->_multipath_probability_valid;
}

- (double)multipath_probability
{
  return self->_multipath_probability;
}

@end