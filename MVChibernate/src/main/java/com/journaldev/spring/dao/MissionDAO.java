package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.Mission;
import com.journaldev.spring.model.User;
 
public interface MissionDAO {
 
    public void addMission(Mission m);
    public void updateMission(Mission m);
    public List<Mission> listMissions();
    public List<Mission> listMissionsByUserId(User userId);
    public Mission getMissionById(int id);
    public void removeMission(int id);
}