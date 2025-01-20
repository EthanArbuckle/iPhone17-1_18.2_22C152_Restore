@interface BRCBouncingReport
+ (BOOL)supportsSecureCoding;
- (BRCBouncingReport)initWithCoder:(id)a3;
- (id)description;
- (unsigned)BouncingCountFromAlsToDir;
- (unsigned)BouncingCountFromAlsToDoc;
- (unsigned)BouncingCountFromAlsToLnk;
- (unsigned)BouncingCountFromAlsToPkg;
- (unsigned)BouncingCountFromDirToAls;
- (unsigned)BouncingCountFromDirToDoc;
- (unsigned)BouncingCountFromDirToLnk;
- (unsigned)BouncingCountFromDirToPkg;
- (unsigned)BouncingCountFromDocToAls;
- (unsigned)BouncingCountFromDocToDir;
- (unsigned)BouncingCountFromDocToLnk;
- (unsigned)BouncingCountFromDocToPkg;
- (unsigned)BouncingCountFromLnkToAls;
- (unsigned)BouncingCountFromLnkToDir;
- (unsigned)BouncingCountFromLnkToDoc;
- (unsigned)BouncingCountFromLnkToPkg;
- (unsigned)BouncingCountFromPkgToAls;
- (unsigned)BouncingCountFromPkgToDir;
- (unsigned)BouncingCountFromPkgToDoc;
- (unsigned)BouncingCountFromPkgToLnk;
- (unsigned)BouncingCountOnSameType;
- (void)encodeWithCoder:(id)a3;
- (void)setBouncingCountFromAlsToDir:(unsigned int)a3;
- (void)setBouncingCountFromAlsToDoc:(unsigned int)a3;
- (void)setBouncingCountFromAlsToLnk:(unsigned int)a3;
- (void)setBouncingCountFromAlsToPkg:(unsigned int)a3;
- (void)setBouncingCountFromDirToAls:(unsigned int)a3;
- (void)setBouncingCountFromDirToDoc:(unsigned int)a3;
- (void)setBouncingCountFromDirToLnk:(unsigned int)a3;
- (void)setBouncingCountFromDirToPkg:(unsigned int)a3;
- (void)setBouncingCountFromDocToAls:(unsigned int)a3;
- (void)setBouncingCountFromDocToDir:(unsigned int)a3;
- (void)setBouncingCountFromDocToLnk:(unsigned int)a3;
- (void)setBouncingCountFromDocToPkg:(unsigned int)a3;
- (void)setBouncingCountFromLnkToAls:(unsigned int)a3;
- (void)setBouncingCountFromLnkToDir:(unsigned int)a3;
- (void)setBouncingCountFromLnkToDoc:(unsigned int)a3;
- (void)setBouncingCountFromLnkToPkg:(unsigned int)a3;
- (void)setBouncingCountFromPkgToAls:(unsigned int)a3;
- (void)setBouncingCountFromPkgToDir:(unsigned int)a3;
- (void)setBouncingCountFromPkgToDoc:(unsigned int)a3;
- (void)setBouncingCountFromPkgToLnk:(unsigned int)a3;
- (void)setBouncingCountOnSameType:(unsigned int)a3;
@end

@implementation BRCBouncingReport

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t BouncingCountOnSameType = self->BouncingCountOnSameType;
  id v5 = a3;
  [v5 encodeInt:BouncingCountOnSameType forKey:@"BouncingCountOnSameType"];
  [v5 encodeInt:self->BouncingCountFromDirToLnk forKey:@"BouncingCountFromDirToLnk"];
  [v5 encodeInt:self->BouncingCountFromDirToAls forKey:@"BouncingCountFromDirToAls"];
  [v5 encodeInt:self->BouncingCountFromDirToPkg forKey:@"BouncingCountFromDirToPkg"];
  [v5 encodeInt:self->BouncingCountFromDirToDoc forKey:@"BouncingCountFromDirToDoc"];
  [v5 encodeInt:self->BouncingCountFromLnkToDir forKey:@"BouncingCountFromLnkToDir"];
  [v5 encodeInt:self->BouncingCountFromLnkToAls forKey:@"BouncingCountFromLnkToAls"];
  [v5 encodeInt:self->BouncingCountFromLnkToPkg forKey:@"BouncingCountFromLnkToPkg"];
  [v5 encodeInt:self->BouncingCountFromLnkToDoc forKey:@"BouncingCountFromLnkToDoc"];
  [v5 encodeInt:self->BouncingCountFromAlsToDir forKey:@"BouncingCountFromAlsToDir"];
  [v5 encodeInt:self->BouncingCountFromAlsToLnk forKey:@"BouncingCountFromAlsToLnk"];
  [v5 encodeInt:self->BouncingCountFromAlsToPkg forKey:@"BouncingCountFromAlsToPkg"];
  [v5 encodeInt:self->BouncingCountFromAlsToDoc forKey:@"BouncingCountFromAlsToDoc"];
  [v5 encodeInt:self->BouncingCountFromPkgToDir forKey:@"BouncingCountFromPkgToDir"];
  [v5 encodeInt:self->BouncingCountFromPkgToLnk forKey:@"BouncingCountFromPkgToLnk"];
  [v5 encodeInt:self->BouncingCountFromPkgToAls forKey:@"BouncingCountFromPkgToAls"];
  [v5 encodeInt:self->BouncingCountFromPkgToDoc forKey:@"BouncingCountFromPkgToDoc"];
  [v5 encodeInt:self->BouncingCountFromDocToDir forKey:@"BouncingCountFromDocToDir"];
  [v5 encodeInt:self->BouncingCountFromDocToLnk forKey:@"BouncingCountFromDocToLnk"];
  [v5 encodeInt:self->BouncingCountFromDocToAls forKey:@"BouncingCountFromDocToAls"];
  [v5 encodeInt:self->BouncingCountFromDocToPkg forKey:@"BouncingCountFromDocToPkg"];
}

- (BRCBouncingReport)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BRCBouncingReport;
  id v5 = [(BRCBouncingReport *)&v7 init];
  if (v5)
  {
    v5->uint64_t BouncingCountOnSameType = [v4 decodeIntForKey:@"BouncingCountOnSameType"];
    v5->BouncingCountFromDirToLnk = [v4 decodeIntForKey:@"BouncingCountFromDirToLnk"];
    v5->BouncingCountFromDirToAls = [v4 decodeIntForKey:@"BouncingCountFromDirToAls"];
    v5->BouncingCountFromDirToPkg = [v4 decodeIntForKey:@"BouncingCountFromDirToPkg"];
    v5->BouncingCountFromDirToDoc = [v4 decodeIntForKey:@"BouncingCountFromDirToDoc"];
    v5->BouncingCountFromLnkToDir = [v4 decodeIntForKey:@"BouncingCountFromLnkToDir"];
    v5->BouncingCountFromLnkToAls = [v4 decodeIntForKey:@"BouncingCountFromLnkToAls"];
    v5->BouncingCountFromLnkToPkg = [v4 decodeIntForKey:@"BouncingCountFromLnkToPkg"];
    v5->BouncingCountFromLnkToDoc = [v4 decodeIntForKey:@"BouncingCountFromLnkToDoc"];
    v5->BouncingCountFromAlsToDir = [v4 decodeIntForKey:@"BouncingCountFromAlsToDir"];
    v5->BouncingCountFromAlsToLnk = [v4 decodeIntForKey:@"BouncingCountFromAlsToLnk"];
    v5->BouncingCountFromAlsToPkg = [v4 decodeIntForKey:@"BouncingCountFromAlsToPkg"];
    v5->BouncingCountFromAlsToDoc = [v4 decodeIntForKey:@"BouncingCountFromAlsToDoc"];
    v5->BouncingCountFromPkgToDir = [v4 decodeIntForKey:@"BouncingCountFromPkgToDir"];
    v5->BouncingCountFromPkgToLnk = [v4 decodeIntForKey:@"BouncingCountFromPkgToLnk"];
    v5->BouncingCountFromPkgToAls = [v4 decodeIntForKey:@"BouncingCountFromPkgToAls"];
    v5->BouncingCountFromPkgToDoc = [v4 decodeIntForKey:@"BouncingCountFromPkgToDoc"];
    v5->BouncingCountFromDocToDir = [v4 decodeIntForKey:@"BouncingCountFromDocToDir"];
    v5->BouncingCountFromDocToLnk = [v4 decodeIntForKey:@"BouncingCountFromDocToLnk"];
    v5->BouncingCountFromDocToAls = [v4 decodeIntForKey:@"BouncingCountFromDocToAls"];
    v5->BouncingCountFromDocToPkg = [v4 decodeIntForKey:@"BouncingCountFromDocToPkg"];
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p st:%u d2l:%u d2a:%u d2p:%u d2f:%u l2d:%u l2a:%u l2p:%u l2f:%u a2d:%u a2l:%u a2p:%u a2f:%u p2d:%u p2l:%u p2a:%u p2f:%u f2d:%u f2l:%u f2a:%u f2p:%u>", objc_opt_class(), self, -[BRCBouncingReport BouncingCountOnSameType](self, "BouncingCountOnSameType"), -[BRCBouncingReport BouncingCountFromDirToLnk](self, "BouncingCountFromDirToLnk"), -[BRCBouncingReport BouncingCountFromDirToAls](self, "BouncingCountFromDirToAls"), -[BRCBouncingReport BouncingCountFromDirToPkg](self, "BouncingCountFromDirToPkg"), -[BRCBouncingReport BouncingCountFromDirToDoc](self, "BouncingCountFromDirToDoc"), -[BRCBouncingReport BouncingCountFromLnkToDir](self, "BouncingCountFromLnkToDir"), -[BRCBouncingReport BouncingCountFromLnkToAls](self, "BouncingCountFromLnkToAls"), -[BRCBouncingReport BouncingCountFromLnkToPkg](self, "BouncingCountFromLnkToPkg"), -[BRCBouncingReport BouncingCountFromLnkToDoc](self, "BouncingCountFromLnkToDoc"), -[BRCBouncingReport BouncingCountFromAlsToDir](self, "BouncingCountFromAlsToDir"), -[BRCBouncingReport BouncingCountFromAlsToLnk](self, "BouncingCountFromAlsToLnk"), -[BRCBouncingReport BouncingCountFromAlsToPkg](self, "BouncingCountFromAlsToPkg"), -[BRCBouncingReport BouncingCountFromAlsToDoc](self, "BouncingCountFromAlsToDoc"), -[BRCBouncingReport BouncingCountFromPkgToDir](self, "BouncingCountFromPkgToDir"),
               [(BRCBouncingReport *)self BouncingCountFromPkgToLnk],
               [(BRCBouncingReport *)self BouncingCountFromPkgToAls],
               [(BRCBouncingReport *)self BouncingCountFromPkgToDoc],
               [(BRCBouncingReport *)self BouncingCountFromDocToDir],
               [(BRCBouncingReport *)self BouncingCountFromDocToLnk],
               [(BRCBouncingReport *)self BouncingCountFromDocToAls],
               [(BRCBouncingReport *)self BouncingCountFromDocToPkg]);
}

- (unsigned)BouncingCountOnSameType
{
  return self->BouncingCountOnSameType;
}

- (void)setBouncingCountOnSameType:(unsigned int)a3
{
  self->uint64_t BouncingCountOnSameType = a3;
}

- (unsigned)BouncingCountFromDirToLnk
{
  return self->BouncingCountFromDirToLnk;
}

- (void)setBouncingCountFromDirToLnk:(unsigned int)a3
{
  self->BouncingCountFromDirToLnk = a3;
}

- (unsigned)BouncingCountFromDirToAls
{
  return self->BouncingCountFromDirToAls;
}

- (void)setBouncingCountFromDirToAls:(unsigned int)a3
{
  self->BouncingCountFromDirToAls = a3;
}

- (unsigned)BouncingCountFromDirToPkg
{
  return self->BouncingCountFromDirToPkg;
}

- (void)setBouncingCountFromDirToPkg:(unsigned int)a3
{
  self->BouncingCountFromDirToPkg = a3;
}

- (unsigned)BouncingCountFromDirToDoc
{
  return self->BouncingCountFromDirToDoc;
}

- (void)setBouncingCountFromDirToDoc:(unsigned int)a3
{
  self->BouncingCountFromDirToDoc = a3;
}

- (unsigned)BouncingCountFromLnkToDir
{
  return self->BouncingCountFromLnkToDir;
}

- (void)setBouncingCountFromLnkToDir:(unsigned int)a3
{
  self->BouncingCountFromLnkToDir = a3;
}

- (unsigned)BouncingCountFromLnkToAls
{
  return self->BouncingCountFromLnkToAls;
}

- (void)setBouncingCountFromLnkToAls:(unsigned int)a3
{
  self->BouncingCountFromLnkToAls = a3;
}

- (unsigned)BouncingCountFromLnkToPkg
{
  return self->BouncingCountFromLnkToPkg;
}

- (void)setBouncingCountFromLnkToPkg:(unsigned int)a3
{
  self->BouncingCountFromLnkToPkg = a3;
}

- (unsigned)BouncingCountFromLnkToDoc
{
  return self->BouncingCountFromLnkToDoc;
}

- (void)setBouncingCountFromLnkToDoc:(unsigned int)a3
{
  self->BouncingCountFromLnkToDoc = a3;
}

- (unsigned)BouncingCountFromAlsToDir
{
  return self->BouncingCountFromAlsToDir;
}

- (void)setBouncingCountFromAlsToDir:(unsigned int)a3
{
  self->BouncingCountFromAlsToDir = a3;
}

- (unsigned)BouncingCountFromAlsToLnk
{
  return self->BouncingCountFromAlsToLnk;
}

- (void)setBouncingCountFromAlsToLnk:(unsigned int)a3
{
  self->BouncingCountFromAlsToLnk = a3;
}

- (unsigned)BouncingCountFromAlsToPkg
{
  return self->BouncingCountFromAlsToPkg;
}

- (void)setBouncingCountFromAlsToPkg:(unsigned int)a3
{
  self->BouncingCountFromAlsToPkg = a3;
}

- (unsigned)BouncingCountFromAlsToDoc
{
  return self->BouncingCountFromAlsToDoc;
}

- (void)setBouncingCountFromAlsToDoc:(unsigned int)a3
{
  self->BouncingCountFromAlsToDoc = a3;
}

- (unsigned)BouncingCountFromPkgToDir
{
  return self->BouncingCountFromPkgToDir;
}

- (void)setBouncingCountFromPkgToDir:(unsigned int)a3
{
  self->BouncingCountFromPkgToDir = a3;
}

- (unsigned)BouncingCountFromPkgToLnk
{
  return self->BouncingCountFromPkgToLnk;
}

- (void)setBouncingCountFromPkgToLnk:(unsigned int)a3
{
  self->BouncingCountFromPkgToLnk = a3;
}

- (unsigned)BouncingCountFromPkgToAls
{
  return self->BouncingCountFromPkgToAls;
}

- (void)setBouncingCountFromPkgToAls:(unsigned int)a3
{
  self->BouncingCountFromPkgToAls = a3;
}

- (unsigned)BouncingCountFromPkgToDoc
{
  return self->BouncingCountFromPkgToDoc;
}

- (void)setBouncingCountFromPkgToDoc:(unsigned int)a3
{
  self->BouncingCountFromPkgToDoc = a3;
}

- (unsigned)BouncingCountFromDocToDir
{
  return self->BouncingCountFromDocToDir;
}

- (void)setBouncingCountFromDocToDir:(unsigned int)a3
{
  self->BouncingCountFromDocToDir = a3;
}

- (unsigned)BouncingCountFromDocToLnk
{
  return self->BouncingCountFromDocToLnk;
}

- (void)setBouncingCountFromDocToLnk:(unsigned int)a3
{
  self->BouncingCountFromDocToLnk = a3;
}

- (unsigned)BouncingCountFromDocToAls
{
  return self->BouncingCountFromDocToAls;
}

- (void)setBouncingCountFromDocToAls:(unsigned int)a3
{
  self->BouncingCountFromDocToAls = a3;
}

- (unsigned)BouncingCountFromDocToPkg
{
  return self->BouncingCountFromDocToPkg;
}

- (void)setBouncingCountFromDocToPkg:(unsigned int)a3
{
  self->BouncingCountFromDocToPkg = a3;
}

@end