﻿using System.Collections.Generic;
using GiveCRM.Models;
using Simple.Data;

namespace GiveCRM.DataAccess
{
    public class MemberSearchFilters
    {
        private readonly dynamic _db = Database.OpenNamedConnection("GiveCRM");

        public IEnumerable<MemberSearchFilter> ForCampaign(int campaignId)
        {
            return _db.MemberSearchFilters.FindAllByCampaignId(campaignId).Cast<MemberSearchFilter>();
        }

        public void Insert(MemberSearchFilter memberSearchFilter)
        {
            _db.MemberSearchFilters.Insert(memberSearchFilter);
        }

        public void Delete(int id)
        {
            _db.MemberSearchFilters.DeleteById(id);
        }
    }
}
